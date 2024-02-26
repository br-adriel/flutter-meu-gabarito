import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meu_gabarito/classes/gabarito.dart';
import 'package:meu_gabarito/classes/questao.dart';
import 'package:mobx/mobx.dart';

part 'gabaritos.g.dart';

class Gabaritos = GabaritosBase with _$Gabaritos;

abstract class GabaritosBase with Store {
  final _collectionRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('gabaritos');

  DocumentSnapshot? _lastDoc;

  @readonly
  bool _loadedAllRecords = false;

  @readonly
  bool _isLoading = false;

  @readonly
  bool _isSaving = false;

  @readonly
  Gabarito? _gabarito;

  @readonly
  ObservableList<Gabarito> _gabaritos = ObservableList.of([]);

  @readonly
  ObservableList<String> _errors = ObservableList.of([]);

  @readonly
  ObservableList<Questao> _questoes = ObservableList.of([]);

  @action
  Future<void> createGabarito(String nome, int tamanho, int indice) async {
    _isSaving = true;
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

      var gabaritoRef = await _collectionRef.add(gabarito.toFirestore());

      for (int i = 0; i < tamanho; i++) {
        questao.numero = indice + i;
        await gabaritoRef.collection('questoes').add(questao.toFirestore());
      }
    } catch (e) {
      _errors.add("Não foi possível criar o gabarito");
      rethrow;
    } finally {
      _isSaving = false;
    }
  }

  @action
  Future<void> getRecentGabaritos({int? limit}) async {
    _isLoading = true;
    _errors.clear();
    _gabaritos.clear();
    try {
      var collectionRef = _collectionRef.orderBy('updatedAt', descending: true);

      if (limit != null) collectionRef = collectionRef.limit(limit);

      final docsSnap = await collectionRef
          .withConverter(
            fromFirestore: Gabarito.fromFirestore,
            toFirestore: (Gabarito gabarito, _) => gabarito.toFirestore(),
          )
          .get();
      final fetchedGabaritos = docsSnap.docs.map((doc) => doc.data());
      _gabaritos.addAll(fetchedGabaritos);
    } catch (e) {
      _errors.add("Não foi possível recuperar os gabaritos");
      rethrow;
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> getNextPage({
    bool isFirstPage = false,
    int pageSize = 10,
  }) async {
    if (isFirstPage) {
      _lastDoc = null;
      _loadedAllRecords = false;
    }
    if (_loadedAllRecords) return;

    _isLoading = true;
    _errors.clear();
    try {
      if (_lastDoc == null) _gabaritos.clear();

      var colRef =
          _collectionRef.orderBy('updatedAt', descending: true).limit(pageSize);

      if (_lastDoc != null) colRef = colRef.startAfterDocument(_lastDoc!);

      final docsSnap = await colRef
          .withConverter(
            fromFirestore: Gabarito.fromFirestore,
            toFirestore: (Gabarito g, _) => g.toFirestore(),
          )
          .get();

      final fetchedGabaritos = docsSnap.docs.map((doc) => doc.data());

      if (docsSnap.docs.isEmpty ||
          _gabaritos.map((g) => g.id).contains(docsSnap.docs.last.id)) {
        _loadedAllRecords = true;
      } else {
        _lastDoc = docsSnap.docs.last;
        _gabaritos.addAll(fetchedGabaritos);
      }
    } catch (e) {
      _errors.add("Não foi possível recuperar os gabaritos");
      rethrow;
    } finally {
      _isLoading = false;
    }
  }

  @action
  List<StreamSubscription> getGabarito(
    String id,
  ) {
    _isLoading = true;
    _errors.clear();

    try {
      final gabaritoListener =
          _collectionRef.doc(id).snapshots().listen((event) {
        _gabarito = Gabarito.fromFirestore(event, null);
      });

      final questoesListener = _collectionRef
          .doc(id)
          .collection('questoes')
          .orderBy('numero', descending: false)
          .snapshots()
          .listen((event) {
        final fetched =
            event.docs.map((doc) => Questao.fromFirestore(doc, null));
        _questoes.clear();
        _questoes.addAll(fetched);
      });

      _isLoading = false;
      return [questoesListener, gabaritoListener];
    } catch (e) {
      _errors.add("Não foi possível recuperar as questões");
      rethrow;
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> deleteGabarito(String id) async {
    _isLoading = true;
    _errors.clear();
    try {
      for (var questao in _questoes.toList()) {
        await _collectionRef
            .doc(id)
            .collection('questoes')
            .doc(questao.id!)
            .delete();
      }
      _questoes.clear();

      await _collectionRef.doc(id).delete();
      _gabaritos.clear();
    } catch (e) {
      _errors.add('Não foi possível apagar o gabarito');
      rethrow;
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> renameGabarito(String id, String name) async {
    _isLoading = true;
    _errors.clear();
    try {
      await _collectionRef.doc(id).update({'nome': name});
    } catch (e) {
      _errors.add('Não foi possível renomar o gabarito');
      rethrow;
    } finally {
      _isLoading = false;
    }
  }
}
