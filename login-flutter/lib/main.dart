import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/app.module.dart';
import 'package:login/app/app.widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final context = SecurityContext.defaultContext;
  context.allowLegacyUnsafeRenegotiation = true;
  runApp(
    ModularApp(
      debugMode: false,
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
