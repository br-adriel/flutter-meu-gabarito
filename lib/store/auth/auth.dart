import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth.g.dart';

class Auth = AuthBase with _$Auth;

abstract class AuthBase with Store {
  @readonly
  bool _isLoading = false;

  @readonly
  User? _user = FirebaseAuth.instance.currentUser;

  @observable
  ObservableList<String> _errors = ObservableList.of([]);

  @action
  Future<void> login(String email, String password) async {
    _errors.clear();
    _isLoading = true;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        _errors.add('Email ou senha incorretos.');
      }
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> logout() async {
    _errors.clear();
    _isLoading = true;
    try {
      await FirebaseAuth.instance.signOut();
      _user = null;
    } catch (e) {
      _errors.add('Um erro ocorreu ao fazer logout.');
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> signup(String email, String password) async {
    _errors.clear();
    _isLoading = true;

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _errors.add('A senha é fraca demais, tente melhorá-la.');
      } else if (e.code == 'email-already-in-use') {
        _errors.add('Já existe uma conta vinculada a esse email.');
      }
    } catch (e) {
      _errors.add('Um erro ocorreu ao tentar criar a conta.');
    } finally {
      _isLoading = false;
    }
  }
}
