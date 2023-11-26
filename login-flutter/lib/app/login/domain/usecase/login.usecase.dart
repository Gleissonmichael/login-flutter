import 'package:login/app/login/domain/entities/dados-login.entity.dart';
import 'package:login/shared/helpers/result.helper.dart';

abstract class LoginUsecase {
  Future<Result<void>> login(DadosLogin dadosLogin);
}
