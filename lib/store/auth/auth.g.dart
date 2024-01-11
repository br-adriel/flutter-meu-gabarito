// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Auth on AuthBase, Store {
  late final _$_isLoadingAtom =
      Atom(name: 'AuthBase._isLoading', context: context);

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

  late final _$_userAtom = Atom(name: 'AuthBase._user', context: context);

  User? get user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  User? get _user => user;

  @override
  set _user(User? value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  late final _$_errorsAtom = Atom(name: 'AuthBase._errors', context: context);

  @override
  ObservableList<String> get _errors {
    _$_errorsAtom.reportRead();
    return super._errors;
  }

  @override
  set _errors(ObservableList<String> value) {
    _$_errorsAtom.reportWrite(value, super._errors, () {
      super._errors = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('AuthBase.login', context: context);

  @override
  Future<void> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$logoutAsyncAction =
      AsyncAction('AuthBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$signupAsyncAction =
      AsyncAction('AuthBase.signup', context: context);

  @override
  Future<void> signup(String email, String password) {
    return _$signupAsyncAction.run(() => super.signup(email, password));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
