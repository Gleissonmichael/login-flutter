// coverage:ignore-file

import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/login/domain/entities/dados-login.entity.dart';

import 'package:mobx/mobx.dart';

part 'login.store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store implements Disposable {
  @observable
  DadosLogin user = const DadosLogin(
    username: '',
    password: '',
  );

  @action
  updateLogin({String? username, String? password}) => user = DadosLogin(
        username: username ?? user.username,
        password: password ?? user.password,
      );

  @override
  void dispose() {
    var cleanStore = LoginStore();
    user = cleanStore.user;
  }
}
