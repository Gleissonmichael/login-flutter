// coverage:ignore-file

import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/shared/stores/store.states.dart';

import 'package:mobx/mobx.dart';

part 'infos.store.g.dart';

class InfosStore = InfosStoreBase with _$InfosStore;

abstract class InfosStoreBase with Store implements Disposable {
  @observable
  DataState<List<String>> infosState = DataStartState();

  @override
  void dispose() {
    var cleanStore = InfosStore();
    infosState = cleanStore.infosState;
  }
}
