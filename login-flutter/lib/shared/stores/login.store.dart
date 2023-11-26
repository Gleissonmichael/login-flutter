// coverage:ignore-file

import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/login/domain/entities/dados-login.entity.dart';
import 'package:login/shared/stores/store.states.dart';

import 'package:mobx/mobx.dart';

part 'login.store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store implements Disposable {
  @observable
  bool rememberAccess = false;
  int countErrosLogin = 0;
  String lastLogin = '';

  @observable
  DataState<DadosLogin> storageState = DataStartState();

  @observable
  DadosLogin user = const DadosLogin(
    username: '',
    password: '',
  );

  @observable
  DateTime loginTime = DateTime.now();

  @action
  updateLogin({String? username, String? password}) => user = DadosLogin(
        username: username ?? user.username,
        password: password ?? user.password,
      );

  @override
  void dispose() {
    var cleanStore = LoginStore();
    user = cleanStore.user;
    storageState = cleanStore.storageState;
  }
}
