import 'package:login/app/login/external/models/dados-login.model.dart';
import 'package:login/shared/helpers/result.helper.dart';

abstract class LoginRepository {
  Future<Result<void>> login(DadosLoginModel dadosLogin);
}
