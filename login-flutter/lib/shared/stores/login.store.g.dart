// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  late final _$rememberAccessAtom =
      Atom(name: 'LoginStoreBase.rememberAccess', context: context);

  @override
  bool get rememberAccess {
    _$rememberAccessAtom.reportRead();
    return super.rememberAccess;
  }

  @override
  set rememberAccess(bool value) {
    _$rememberAccessAtom.reportWrite(value, super.rememberAccess, () {
      super.rememberAccess = value;
    });
  }

  late final _$storageStateAtom =
      Atom(name: 'LoginStoreBase.storageState', context: context);

  @override
  DataState<DadosLogin> get storageState {
    _$storageStateAtom.reportRead();
    return super.storageState;
  }

  @override
  set storageState(DataState<DadosLogin> value) {
    _$storageStateAtom.reportWrite(value, super.storageState, () {
      super.storageState = value;
    });
  }

  late final _$userAtom = Atom(name: 'LoginStoreBase.user', context: context);

  @override
  DadosLogin get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(DadosLogin value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$loginTimeAtom =
      Atom(name: 'LoginStoreBase.loginTime', context: context);

  @override
  DateTime get loginTime {
    _$loginTimeAtom.reportRead();
    return super.loginTime;
  }

  @override
  set loginTime(DateTime value) {
    _$loginTimeAtom.reportWrite(value, super.loginTime, () {
      super.loginTime = value;
    });
  }

  late final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase', context: context);

  @override
  dynamic updateLogin({String? username, String? password}) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.updateLogin');
    try {
      return super.updateLogin(username: username, password: password);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rememberAccess: ${rememberAccess},
storageState: ${storageState},
user: ${user},
loginTime: ${loginTime}
    ''';
  }
}
