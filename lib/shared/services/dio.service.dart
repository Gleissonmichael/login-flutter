// coverage:ignore-file

import 'dart:async';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:login/shared/stores/app.store.dart';
import 'package:login/shared/stores/login.store.dart';

class DioService {
  final Dio dio;
  final LoginStore loginStore;
  final AppStore appStore;

  DioService(
    this.dio,
    this.loginStore,
    this.appStore,
  ) {
    if (dio.httpClientAdapter is DefaultHttpClientAdapter) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
    }
  }

  void _addCommonHeaders(Map<String, String> headers, bool useCache) {
    headers['Connection'] = "keep-alive";
    if (useCache == false) {
      headers['Cache-Control'] = 'no-cache';
    }
  }

  /// Handy method to make a http DELETE request
  Future<Response> delete<T>(String path,
      {CancelToken? cancelToken,
      String? contentType,
      List<String>? cookies,
      bool useCache = true}) async {
    cancelToken = cancelToken ?? CancelToken();
    var headers = {Headers.contentTypeHeader: 'application/json'};

    if (cookies != null) {
      var cookiesConcat = cookies.map((e) => e.substring(0, e.indexOf(';'))).join(';');
      headers['cookie'] = cookiesConcat;
    }

    _addCommonHeaders(headers, useCache);

    try {
      final response = await dio
          .delete<T>(path,
              options: Options(
                headers: headers,
                followRedirects: false,
                validateStatus: (status) {
                  return status != null && status >= 200 && status <= 302;
                },
              ),
              cancelToken: cancelToken)
          .timeout(const Duration(seconds: 60));

      return response;
    } on Exception catch (error) {
      cancelToken.cancel();
      if (error is TimeoutException) {
      } else {}
      var errorResponse = error;
      throw errorResponse;
    }
  }

  /// Handy method to make a http GET request.
  /// The param cookies receives the raw cookie header value.
  Future<Response<T>> get<T>(String path,
      {CancelToken? cancelToken, List<String>? cookies, bool useCache = true}) async {
    cancelToken = cancelToken ?? CancelToken();

    var headers = {
      Headers.contentTypeHeader: 'application/json',
    };

    _addCommonHeaders(headers, useCache);

    if (cookies != null) {
      var cookiesConcat = cookies.map((e) => e.substring(0, e.indexOf(';'))).join(';');
      headers['cookie'] = cookiesConcat;
    }

    try {
      final response = await dio
          .get<T>(
            path,
            options: Options(
              headers: headers,
              followRedirects: false,
              extra: {'withCredentials': cookies != null && cookies.isNotEmpty},
              validateStatus: (status) {
                return status != null && status >= 200 && status <= 302;
              },
            ),
            cancelToken: cancelToken,
          )
          .timeout(const Duration(seconds: 60));

      return response;
    } on Exception catch (error) {
      cancelToken.cancel();

      var errorResponse = error;
      throw errorResponse;
    }
  }

//Response(data: null, statusCode: 500, requestOptions: RequestOptions(path: path)))
  /// Handy method to make a http POST request
  /// /// The param cookies receives the raw cookie header value.
  Future<Response<T>> post<T>(String path, dynamic body,
      {bool useCookies = false,
      String? contentType,
      List<String>? cookies,
      CancelToken? cancelToken,
      bool useCache = true}) async {
    cancelToken = cancelToken ?? CancelToken();

    var headers = <String, String>{};
    if (body is! FormData) {
      headers[Headers.contentTypeHeader] = contentType ?? 'application/json';
      headers[Headers.acceptHeader] = '*/*';
    }

    if (cookies != null) {
      var cookiesConcat = cookies.map((e) => e.substring(0, e.indexOf(';'))).join(';');
      headers['cookie'] = cookiesConcat;
    }

    _addCommonHeaders(headers, useCache);

    //MOCK de login
    if (path.contains('/login')) {
      return Response(data: null, requestOptions: RequestOptions(path: ''), statusCode: 200);
    }

    try {
      final response = await dio
          .post<T>(path,
              data: body,
              options: Options(
                headers: headers,
                followRedirects: false,
                validateStatus: (status) {
                  return status != null && status >= 200 && status <= 302;
                },
              ),
              cancelToken: cancelToken)
          .timeout(const Duration(seconds: 60));
      return response;
    } on Exception catch (error) {
      cancelToken.cancel();

      var errorResponse = error;
      throw errorResponse;
    }
  }

  /// Handy method to make a http PUT request
  Future<Response> put<T>(String path, dynamic body,
      {bool useCookies = false,
      String? contentType,
      List<String>? cookies,
      CancelToken? cancelToken,
      bool useCache = true}) async {
    cancelToken = cancelToken ?? CancelToken();
    var headers = <String, String>{};
    if (body is! FormData) {
      headers[Headers.contentTypeHeader] = contentType ?? 'application/json';
      headers[Headers.acceptHeader] = '*/*';
    }

    if (cookies != null) {
      var cookiesConcat = cookies.map((e) => e.substring(0, e.indexOf(';'))).join(';');
      headers['cookie'] = cookiesConcat;
    }

    _addCommonHeaders(headers, useCache);

    try {
      final response = await dio
          .put<T>(path,
              data: body,
              options: Options(
                headers: headers,
                followRedirects: false,
                validateStatus: (status) {
                  return status != null && status >= 200 && status <= 302;
                },
              ),
              cancelToken: cancelToken)
          .timeout(const Duration(seconds: 60));

      return response;
    } on Exception catch (error) {
      cancelToken.cancel();

      var errorResponse = error;
      throw errorResponse;
    }
  }
}
