// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gabaritos.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Gabaritos on GabaritosBase, Store {
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

  late final _$getGabaritosAsyncAction =
      AsyncAction('GabaritosBase.getGabaritos', context: context);

  @override
  Future<void> getGabaritos({int? limit}) {
    return _$getGabaritosAsyncAction
        .run(() => super.getGabaritos(limit: limit));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
