import 'endpoint.dart';
import 'login.controller.dart';

class Endpoints {
  static const useMocks = false;

  static String get url => 'http://localhost:4001';
  static String get baseMockUrl => 'http://localhost:4001';

  static LoginController login = LoginController(
    login: Endpoint(baseUrl: url, path: '/login', useMock: true, mockPath: '/login'),
  );
}
