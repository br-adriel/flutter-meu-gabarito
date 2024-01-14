import 'package:firebase_auth/firebase_auth.dart';
import 'package:meu_gabarito/validators/email_validator.dart';
import 'package:mobx/mobx.dart';

part 'auth.g.dart';

class Auth = AuthBase with _$Auth;

abstract class AuthBase with Store {
  @readonly
  bool _isLoading = false;

  @readonly
  User? _user = FirebaseAuth.instance.currentUser;

  @readonly
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
      if (e.code == 'invalid-credential') {
        _errors.add('Email ou senha incorretos.');
      }
    } catch (e) {
      _errors.add('Um erro ocorreu ao tentar fazer login.');
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
  Future<void> resetPassword(String email) async {
    _errors.clear();
    if (email.isEmpty || validateEmail(email) is String) {
      _errors.add("Insira um email válido");
      return;
    }
    _isLoading = true;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      _errors.add("Um erro ocorreu.");
    }
    _isLoading = false;
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

  @action
  Future<void> updatePhoto(String photoUrl) async {
    _errors.clear();
    _isLoading = true;

    try {
      if (_user != null) {
        _errors.add("Nenhum usuário autenticado");
      } else {
        await _user?.updatePhotoURL(photoUrl);
      }
    } catch (e) {
      _errors.add('Um erro ocorreu ao tentar atualizar a imagem de perfil.');
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> updateName(String displayName) async {
    _errors.clear();
    _isLoading = true;

    try {
      if (_user != null) {
        _errors.add("Nenhum usuário autenticado");
      } else {
        await _user?.updateDisplayName(displayName);
      }
    } catch (e) {
      _errors.add('Um erro ocorreu ao tentar atualizar o nome de perfil.');
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> updateEmail(String email, String currentPassword) async {
    _errors.clear();
    _isLoading = true;

    try {
      if (_user == null) {
        _errors.add("Nenhum usuário autenticado");
      } else {
        AuthCredential credential = EmailAuthProvider.credential(
          email: _user!.email!,
          password: currentPassword,
        );
        await _user!.reauthenticateWithCredential(credential);
        await _user!.updateEmail(email);
      }
    } catch (e) {
      _errors.add('Um erro ocorreu ao tentar atualizar o email.');
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> updatePassword(
      String newPassword, String currentPassword) async {
    _errors.clear();
    _isLoading = true;

    try {
      if (_user != null) {
        _errors.add("Nenhum usuário autenticado");
      } else {
        AuthCredential credential = EmailAuthProvider.credential(
          email: _user!.email!,
          password: currentPassword,
        );
        await _user!.reauthenticateWithCredential(credential);
        await _user!.updatePassword(newPassword);
      }
    } catch (e) {
      _errors.add('Um erro ocorreu ao tentar atualizar a senha.');
    } finally {
      _isLoading = false;
    }
  }
}
