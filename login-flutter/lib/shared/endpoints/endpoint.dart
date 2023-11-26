import 'dart:developer';

import 'package:login/shared/extensions/string.extension.dart';

import 'endpoint.config.dart';

class Endpoint {
  final String? baseUrl;
  final String path;

  final bool useMock;
  final String? mockPath;

  const Endpoint({
    this.baseUrl,
    required this.path,
    this.useMock = false,
    this.mockPath,
  });

  bool get isMocked => useMock || Endpoints.useMocks;

  String buildUrl({Map<String, String>? queryParams, Map<String, String>? routeParams}) {
    if (isMocked) {
      var urlMock = Endpoints.baseMockUrl + mockPath!;
      log("Aviso: O endpoint $path está mockado e apontando para $urlMock.");
      if (Endpoints.baseMockUrl.contains('https')) {
        log("Aviso: A url do mock (${Endpoints.baseMockUrl}) está usando https. Isso vai causar erros na requisição.");
      }
      return urlMock;
    }

    var base = baseUrl ?? "";
    var url = path;
    if (routeParams != null) {
      url = url.useRouteParams(routeParams);
    }
    if (queryParams != null) {
      url = url.addQueryParams(queryParams);
    }
    if (url[0] != '/') {
      url = '/$url';
    }
    if (base.endsWith('/')) {
      base = base.substring(0, base.length - 2);
    }

    return base + url;
  }
}
