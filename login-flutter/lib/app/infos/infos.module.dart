import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/infos/infos.store.dart';
import 'package:login/app/infos/presenter/infos.page.dart';
import 'package:login/app/login/domain/usecase/login.usecase.dart';
import 'package:login/shared/services/context.service.dart';

import 'package:login/shared/services/launcher.service.dart';
import 'package:login/shared/services/modular.service.dart';

class InfosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<LauncherService>((e) => LauncherService(), isSingleton: true),
    Bind.singleton((i) => InfosStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, __) => InfosPage(
              modularService: Modular.get<ModularService>(),
              contextService: Modular.get<ContextService>(),
              launcherService: Modular.get<LauncherService>(),
              store: Modular.get<InfosStore>(),
              loginUsecase: Modular.get<LoginUsecase>(),
            )),
  ];
}
