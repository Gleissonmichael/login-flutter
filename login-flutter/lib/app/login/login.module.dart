import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/login/presenter/login/login.page.dart';
import 'package:login/app/login/presenter/splash-screen/splash-screen.page.dart';
import 'package:login/shared/services/context.service.dart';
import 'package:login/shared/services/modular.service.dart';
import 'package:login/shared/stores/login.store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => SplashScreenPage()),
    ChildRoute('/login',
        child: (_, __) => LoginPage(
              modularService: Modular.get<ModularService>(),
              contextService: Modular.get<ContextService>(),
              store: Modular.get<LoginStore>(),
            )),
  ];
}
