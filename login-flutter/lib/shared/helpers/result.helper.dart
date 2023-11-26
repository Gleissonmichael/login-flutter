// coverage:ignore-file

import 'package:equatable/equatable.dart';
import 'package:login/shared/enums/resultType.enum.dart';
import 'package:login/shared/helpers/errorResult.helper.dart';
import 'package:login/shared/helpers/successResult.helper.dart';

abstract class Result<TData> extends Equatable {
  final ResultTypes status;

  const Result(this.status);

  @override
  List<Object?> get props => [status];
}

extension ResultExtension<TData> on Result<TData> {
  bool isSuccess() => this is SuccessResult<TData>;

  TData getSuccessData() {
    assert(isSuccess(),
        "O Result é um erro. Verifique com result.isSuccess() antes de usar esse método.");

    return (this as SuccessResult<TData>).data;
  }

  ErrorResult<NewTData> convertErrorResult<NewTData>(
      [String? newErrorCode, String? newErrorMessage, String? newData, List<String>? cookies]) {
    assert(this is ErrorResult<TData>,
        "O Result não é um erro. Verifique com result.isSuccess() antes de usar esse método.");

    var oldError = (this as ErrorResult<TData>);

    return ErrorResult(oldError.status,
        code: newErrorCode ?? oldError.code,
        message: newErrorMessage ?? oldError.message,
        cookies: cookies ?? oldError.cookies,
        data: newData ?? oldError.data,
        validationErrors: oldError.validationErrors);
  }

  ErrorResult<TData> toErrorResult() {
    assert(this is ErrorResult<TData>,
        "O Result não é um erro. Verifique com result.isSuccess() antes de usar esse método.");

    return (this as ErrorResult<TData>);
  }
}
