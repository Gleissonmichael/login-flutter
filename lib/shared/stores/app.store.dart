// coverage:ignore-file

import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';

part 'app.store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store implements Disposable {
  @observable
  bool isFabBeingShown = true;

  @observable
  bool isRequestsBeingShown = false;

  @observable
  bool isRequestPageBeingShown = false;

  @observable
  int? selectedResponseIndex;

  @override
  void dispose() {
    var cleanStore = AppStore();
    isFabBeingShown = cleanStore.isFabBeingShown;
    isRequestsBeingShown = cleanStore.isRequestsBeingShown;
    isRequestPageBeingShown = cleanStore.isRequestPageBeingShown;
  }
}
