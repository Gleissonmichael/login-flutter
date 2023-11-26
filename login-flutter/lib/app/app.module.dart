import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/login/domain/repositories/login.repository.dart';
import 'package:login/app/login/domain/usecase/login.usecase.dart';
import 'package:login/app/login/domain/usecase/login.usecase_impl.dart';
import 'package:login/app/login/external/repositories/login.repository_impl.dart';
import 'package:login/app/login/login.module.dart';
import 'package:login/shared/services/context.service.dart';
import 'package:login/shared/services/dio.service.dart';
import 'package:login/shared/services/modular.service.dart';
import 'package:login/shared/stores/app.store.dart';
import 'package:login/shared/stores/login.store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<Dio>((e) => Dio(), isSingleton: false),
    Bind.singleton((i) => LoginStore()),
    Bind.singleton((i) => AppStore()),
    BindInject<DioService>(
      (inject) => DioService(
        inject<Dio>(),
        inject<LoginStore>(),
        inject<AppStore>(),
      ),
      isSingleton: false,
    ),
    Bind<ContextService>((e) => ContextService(), isSingleton: true),
    Bind<ModularService>((e) => ModularService(), isSingleton: true),
    BindInject<LoginRepository>(
      (inject) => LoginRepositoryImpl(inject<DioService>()),
      isSingleton: false,
    ),
    BindInject<LoginUsecase>((inject) => LoginUsecaseImpl(inject<LoginRepository>()),
        isSingleton: false),
    BindInject<LoginUsecaseImpl>(
      (inject) => LoginUsecaseImpl(
        inject<LoginRepository>(),
      ),
      isSingleton: false,
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/info', module: LoginModule()),
  ];
}
