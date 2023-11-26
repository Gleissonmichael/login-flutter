import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/login/login.module.dart';
import 'package:login/shared/services/context.service.dart';
import 'package:login/shared/services/modular.service.dart';
import 'package:login/shared/stores/app.store.dart';
import 'package:login/shared/stores/login.store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<Dio>((e) => Dio(), isSingleton: false),
    Bind<ContextService>((e) => ContextService(), isSingleton: true),
    Bind<ModularService>((e) => ModularService(), isSingleton: true),
    Bind.singleton((i) => LoginStore()),
    Bind.singleton((i) => AppStore()),

    // Identity
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/area-nao-logada', module: LoginModule()),
  ];
}
