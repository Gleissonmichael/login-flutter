import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/login/domain/usecase/login.usecase.dart';
import 'package:login/app/login/presenter/login/login.page.dart';
import 'package:login/app/login/presenter/splash-screen/splash-screen.page.dart';
import 'package:login/shared/services/context.service.dart';

import 'package:login/shared/services/launcher.service.dart';
import 'package:login/shared/services/modular.service.dart';
import 'package:login/shared/stores/login.store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<LauncherService>((e) => LauncherService(), isSingleton: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => SplashScreenPage()),
    ChildRoute('/login',
        child: (_, __) => LoginPage(
              modularService: Modular.get<ModularService>(),
              contextService: Modular.get<ContextService>(),
              launcherService: Modular.get<LauncherService>(),
              store: Modular.get<LoginStore>(),
              loginUsecase: Modular.get<LoginUsecase>(),
            )),
  ];
}
