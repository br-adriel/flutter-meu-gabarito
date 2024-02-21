import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meu_gabarito/classes/gabarito.dart';
import 'package:meu_gabarito/classes/questao.dart';
import 'package:mobx/mobx.dart';

part 'gabaritos.g.dart';

class Gabaritos = GabaritosBase with _$Gabaritos;

abstract class GabaritosBase with Store {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @readonly
  bool _isLoading = false;

  @readonly
  ObservableList<Gabarito> _gabaritos = ObservableList.of([]);

  @readonly
  ObservableList<String> _errors = ObservableList.of([]);

  @readonly
  ObservableList<Questao> _questoes = ObservableList.of([]);

  @action
  Future<void> createGabarito(String nome, int tamanho, int indice) async {
    _isLoading = true;
    _errors.clear();
    try {
      var gabarito = Gabarito(
        contagemCorretas: 0,
        contagemCorrigidas: 0,
        nome: nome,
        tamanho: tamanho,
        id: null,
      );

      var questao = Questao(
        alternativaSelecionada: null,
        corrigida: false,
        numero: indice,
        alternativaCorreta: null,
      );

      var gabaritoRef = await _db
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('gabaritos')
          .add(gabarito.toFirestore());

      for (int i = indice; i <= tamanho; i++) {
        questao.numero = i;
        await gabaritoRef.collection('questoes').add(questao.toFirestore());
      }
    } catch (e) {
      _errors.add("Não foi possível criar o gabarito");
    } finally {
      _isLoading = false;
    }
  }
}
