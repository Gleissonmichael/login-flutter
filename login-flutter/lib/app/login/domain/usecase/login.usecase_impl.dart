import 'package:login/app/login/domain/entities/dados-login.entity.dart';
import 'package:login/app/login/domain/repositories/login.repository.dart';
import 'package:login/app/login/domain/usecase/login.usecase.dart';
import 'package:login/app/login/external/models/dados-login.model.dart';
import 'package:login/shared/helpers/result.helper.dart';
import 'package:login/shared/helpers/successResult.helper.dart';

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository repository;

  LoginUsecaseImpl(this.repository);

  @override
  Future<Result<void>> login(DadosLogin login) async {
    var result =
        await repository.login(DadosLoginModel(username: login.username, password: login.password));

    if (!result.isSuccess()) {
      return result.convertErrorResult();
    }

    return const SuccessResult(null);
  }
}
