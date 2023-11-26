// coverage:ignore-file

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
