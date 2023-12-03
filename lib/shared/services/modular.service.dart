// coverage:ignore-file

import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
// ignore: implementation_imports
import 'package:modular_core/modular_core.dart';

typedef ModularInterceptor
    = MapEntry<String, FutureOr<bool> Function(bool stopDefaultButtonEvent, RouteInfo info)>;

class ModularService {
  final List<ModularInterceptor> _interceptorFunctions = [];

  ModularService() {
    BackButtonInterceptor.add(mainInterceptor, ifNotYetIntercepted: true);
  }

  Type? inject<Type extends Object>() {
    return Modular.get<Type>();
  }

  Future<T?> pushNamed<T extends Object?>(String routeName,
      {Object? arguments, bool forRoot = false}) {
    return Modular.to.pushNamed(routeName, arguments: arguments, forRoot: forRoot);
  }

  Future<void> pushPage<T extends Object?>(Widget page,
      {TransitionType transition = TransitionType.rightToLeft}) {
    assert(transitions[transition] != null, true);
    var transitionBuilder = transitions[transition]!;
    var routeBuilder = transitionBuilder(
        (context, a) => page, const Duration(milliseconds: 300), const RouteSettings(), true);
    return Modular.to.push(routeBuilder);
  }

  navigate<T extends Object?>(String routeName, {Object? arguments}) {
    return Modular.to.navigate(routeName, arguments: arguments);
  }

  String getCurrentRoute<T extends Object?>() {
    return Modular.to.path;
  }

  void pop<T>([T? value]) {
    return Modular.to.pop(value);
  }

  void popUntil(String route) {
    return Modular.to.popUntil(ModalRoute.withName(route));
  }

  void popUntilAndPushNamed(String removeUntilRoute, String newRoute,
      {Object? arguments, bool forRoot = false}) {
    Modular.to.popUntil(ModalRoute.withName(removeUntilRoute));
    Modular.to.pushNamed(newRoute, arguments: arguments, forRoot: forRoot);
  }

  void popRepeatedly({required int pagesToGoBack}) {
    for (var i = 0; i < pagesToGoBack; i++) {
      if (Modular.to.canPop()) {
        Modular.to.pop();
      }
    }
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Modular.to.pushReplacementNamed(routeName, arguments: arguments);
  }

  void pushNamedAndRemoveUntil(String newRoute, String oldRoute, {Object? arguments}) {
    Modular.to
        .pushNamedAndRemoveUntil(newRoute, ModalRoute.withName(oldRoute), arguments: arguments);
  }

  void removeAndPushNamed(String newRoute, String oldRoute) {
    Modular.to.navigate(newRoute);
  }

  void goBackThenPushNamed(String newRoute, {required int pagesToGoBack, Object? arguments}) {
    for (var i = 0; i < pagesToGoBack; i++) {
      if (Modular.to.canPop()) {
        Modular.to.pop();
      }
    }
    Modular.to.pushNamed(newRoute, arguments: arguments);
  }

  void goBackThenReload({required int pagesToGoBack}) {
    for (var i = 0; i < pagesToGoBack; i++) {
      if (Modular.to.canPop()) {
        Modular.to.pop();
      }
    }
    Modular.to.pushReplacementNamed('.');
  }

  FutureOr<bool> mainInterceptor(bool stopDefaultButtonEvent, RouteInfo info) async {
    FutureOr<bool> result = false;
    if (_interceptorFunctions.isNotEmpty) {
      var lastInterceptor = _interceptorFunctions.last;
      if (lastInterceptor.key == Modular.to.path) {
        result = await lastInterceptor.value(stopDefaultButtonEvent, info);
      }
    }
    return result;
  }

  void addBackButtonInterceptor(
      {required FutureOr<bool> Function(bool stopDefaultButtonEvent, RouteInfo info) interceptor}) {
    _interceptorFunctions.add(MapEntry(Modular.to.path, interceptor));
  }

  void removeBackButtonInterceptor(
      {required FutureOr<bool> Function(bool stopDefaultButtonEvent, RouteInfo info) interceptor}) {
    ModularInterceptor? lastInterceptor;
    for (ModularInterceptor interceptorRegistered in _interceptorFunctions) {
      if (interceptorRegistered.value == interceptor) {
        lastInterceptor = interceptorRegistered;
      }
    }
    _interceptorFunctions.remove(lastInterceptor);
  }

  final Map<
      TransitionType,
      PageRouteBuilder<dynamic> Function(
    Widget Function(BuildContext, ModularArguments) builder,
    Duration transitionDuration,
    RouteSettings settings,
    bool maintainState,
  )> transitions = {
    TransitionType.fadeIn: fadeInTransition,
    TransitionType.rightToLeft: rightToLeft,
    TransitionType.leftToRight: leftToRight,
    TransitionType.upToDown: upToDown,
    TransitionType.downToUp: downToUp,
    TransitionType.scale: scale,
    TransitionType.rotate: rotate,
    TransitionType.size: size,
    TransitionType.rightToLeftWithFade: rightToLeftWithFade,
    TransitionType.leftToRightWithFade: leftToRightWithFade,
  };
}
