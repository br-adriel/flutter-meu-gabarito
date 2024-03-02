// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gabaritos.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Gabaritos on GabaritosBase, Store {
  late final _$_loadedAllRecordsAtom =
      Atom(name: 'GabaritosBase._loadedAllRecords', context: context);

  bool get loadedAllRecords {
    _$_loadedAllRecordsAtom.reportRead();
    return super._loadedAllRecords;
  }

  @override
  bool get _loadedAllRecords => loadedAllRecords;

  @override
  set _loadedAllRecords(bool value) {
    _$_loadedAllRecordsAtom.reportWrite(value, super._loadedAllRecords, () {
      super._loadedAllRecords = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'GabaritosBase._isLoading', context: context);

  bool get isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  bool get _isLoading => isLoading;

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_isSavingAtom =
      Atom(name: 'GabaritosBase._isSaving', context: context);

  bool get isSaving {
    _$_isSavingAtom.reportRead();
    return super._isSaving;
  }

  @override
  bool get _isSaving => isSaving;

  @override
  set _isSaving(bool value) {
    _$_isSavingAtom.reportWrite(value, super._isSaving, () {
      super._isSaving = value;
    });
  }

  late final _$_gabaritoAtom =
      Atom(name: 'GabaritosBase._gabarito', context: context);

  Gabarito? get gabarito {
    _$_gabaritoAtom.reportRead();
    return super._gabarito;
  }

  @override
  Gabarito? get _gabarito => gabarito;

  @override
  set _gabarito(Gabarito? value) {
    _$_gabaritoAtom.reportWrite(value, super._gabarito, () {
      super._gabarito = value;
    });
  }

  late final _$_isCorrectionModeEnabledAtom =
      Atom(name: 'GabaritosBase._isCorrectionModeEnabled', context: context);

  bool get isCorrectionModeEnabled {
    _$_isCorrectionModeEnabledAtom.reportRead();
    return super._isCorrectionModeEnabled;
  }

  @override
  bool get _isCorrectionModeEnabled => isCorrectionModeEnabled;

  @override
  set _isCorrectionModeEnabled(bool value) {
    _$_isCorrectionModeEnabledAtom
        .reportWrite(value, super._isCorrectionModeEnabled, () {
      super._isCorrectionModeEnabled = value;
    });
  }

  late final _$_gabaritosAtom =
      Atom(name: 'GabaritosBase._gabaritos', context: context);

  ObservableList<Gabarito> get gabaritos {
    _$_gabaritosAtom.reportRead();
    return super._gabaritos;
  }

  @override
  ObservableList<Gabarito> get _gabaritos => gabaritos;

  @override
  set _gabaritos(ObservableList<Gabarito> value) {
    _$_gabaritosAtom.reportWrite(value, super._gabaritos, () {
      super._gabaritos = value;
    });
  }

  late final _$_errorsAtom =
      Atom(name: 'GabaritosBase._errors', context: context);

  ObservableList<String> get errors {
    _$_errorsAtom.reportRead();
    return super._errors;
  }

  @override
  ObservableList<String> get _errors => errors;

  @override
  set _errors(ObservableList<String> value) {
    _$_errorsAtom.reportWrite(value, super._errors, () {
      super._errors = value;
    });
  }

  late final _$_questoesAtom =
      Atom(name: 'GabaritosBase._questoes', context: context);

  ObservableList<Questao> get questoes {
    _$_questoesAtom.reportRead();
    return super._questoes;
  }

  @override
  ObservableList<Questao> get _questoes => questoes;

  @override
  set _questoes(ObservableList<Questao> value) {
    _$_questoesAtom.reportWrite(value, super._questoes, () {
      super._questoes = value;
    });
  }

  late final _$createGabaritoAsyncAction =
      AsyncAction('GabaritosBase.createGabarito', context: context);

  @override
  Future<void> createGabarito(String nome, int tamanho, int indice) {
    return _$createGabaritoAsyncAction
        .run(() => super.createGabarito(nome, tamanho, indice));
  }

  late final _$getRecentGabaritosAsyncAction =
      AsyncAction('GabaritosBase.getRecentGabaritos', context: context);

  @override
  Future<void> getRecentGabaritos({int? limit}) {
    return _$getRecentGabaritosAsyncAction
        .run(() => super.getRecentGabaritos(limit: limit));
  }

  late final _$getNextPageAsyncAction =
      AsyncAction('GabaritosBase.getNextPage', context: context);

  @override
  Future<void> getNextPage({bool isFirstPage = false, int pageSize = 10}) {
    return _$getNextPageAsyncAction.run(
        () => super.getNextPage(isFirstPage: isFirstPage, pageSize: pageSize));
  }

  late final _$deleteGabaritoAsyncAction =
      AsyncAction('GabaritosBase.deleteGabarito', context: context);

  @override
  Future<void> deleteGabarito(String id) {
    return _$deleteGabaritoAsyncAction.run(() => super.deleteGabarito(id));
  }

  late final _$renameGabaritoAsyncAction =
      AsyncAction('GabaritosBase.renameGabarito', context: context);

  @override
  Future<void> renameGabarito(String id, String name) {
    return _$renameGabaritoAsyncAction
        .run(() => super.renameGabarito(id, name));
  }

  late final _$setAlternativaAsyncAction =
      AsyncAction('GabaritosBase.setAlternativa', context: context);

  @override
  Future<void> setAlternativa(String questaoId, Alternativa alternativa) {
    return _$setAlternativaAsyncAction
        .run(() => super.setAlternativa(questaoId, alternativa));
  }

  late final _$correctQuestaoAsyncAction =
      AsyncAction('GabaritosBase.correctQuestao', context: context);

  @override
  Future<void> correctQuestao(String questaoId,
      Alternativa alternativaSelecionada, Alternativa alternativaCorreta) {
    return _$correctQuestaoAsyncAction.run(() => super
        .correctQuestao(questaoId, alternativaSelecionada, alternativaCorreta));
  }

  late final _$GabaritosBaseActionController =
      ActionController(name: 'GabaritosBase', context: context);

  @override
  List<StreamSubscription<dynamic>> getGabarito(String id) {
    final _$actionInfo = _$GabaritosBaseActionController.startAction(
        name: 'GabaritosBase.getGabarito');
    try {
      return super.getGabarito(id);
    } finally {
      _$GabaritosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
