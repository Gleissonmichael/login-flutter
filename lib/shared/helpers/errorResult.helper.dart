// coverage:ignore-file

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:login/shared/enums/resultType.enum.dart';

import 'result.helper.dart';

class ErrorResult<T> extends Result<T> {
  late final String code;
  final String message;
  final String? data;
  final List<String>? cookies;
  late final List validationErrors;

  ErrorResult(
    ResultTypes status, {
    required String code,
    required this.message,
    this.cookies,
    this.data,
    List? validationErrors,
  }) : super(status) {
    this.validationErrors = validationErrors ?? [];
  }

  factory ErrorResult.fromErrorResponse(Response<dynamic>? response) {
    if (response == null || response.data == null) {
      return getDefaultError<T>();
    }

    Map<String, dynamic> jsonData;
    if (response.statusCode == 401) {
      return ErrorResult(response.statusCode.toResultType(),
          code: "Unauthorized", message: "A sessão do usuário expirou.");
    } else if (response.data is Map<String, dynamic>) {
      jsonData = response.data as Map<String, dynamic>;
    } else if (response.data is String && (response.data as String).isNotEmpty) {
      try {
        jsonData = json.decode(response.data as String) as Map<String, dynamic>;
      } on FormatException catch (_) {
        return getDefaultError<T>();
      }
    } else {
      return getDefaultError<T>();
    }

    if (jsonData['error'] == null) {
      return getDefaultError<T>();
    }

    var cookies = response.headers["set-cookie"];

    return ErrorResult(response.statusCode.toResultType(),
        code: jsonData['error']['code'] as String,
        cookies: cookies,
        message: jsonData['error']['message'] as String,
        data: jsonData['error']['data'] as String?,
        validationErrors: const []);
  }

  static ErrorResult<T> getDefaultError<T>() => ErrorResult<T>(ResultTypes.internalServerError,
      code: 'NetworkError', message: 'Erro desconhecido ao realizar a conexão.');

  static ErrorResult<T> getCancelTokenError<T>() => ErrorResult<T>(ResultTypes.cancelledToken,
      code: 'Cancelled Token', message: 'Chamada cancelada');

  @override
  List<Object?> get props => super.props + [code, message, data, validationErrors];
}

extension ErrorResultExtension on String {
  T? toEnum<T extends Object>(List<T> values) {
    for (var val in values) {
      if (describeEnum(val).toLowerCase() == toLowerCase()) return val;
    }
    return null;
  }
}
