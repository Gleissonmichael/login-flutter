// ignore_for_file: avoid_print

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:login/app/login/domain/repositories/login.repository.dart';
import 'package:login/app/login/external/models/dados-login.model.dart';
import 'package:login/shared/endpoints/endpoint.config.dart';
import 'package:login/shared/helpers/errorResult.helper.dart';
import 'package:login/shared/helpers/result.helper.dart';
import 'package:login/shared/helpers/successResult.helper.dart';
import 'package:login/shared/services/dio.service.dart';

class LoginRepositoryImpl implements LoginRepository {
  final DioService dio;

  LoginRepositoryImpl(this.dio);

  @override
  Future<Result<void>> login(DadosLoginModel login) async {
    final url = Endpoints.login.login.buildUrl();

    try {
      await dio.post(url, {
        "username": login.username,
        "password": login.password,
      });
    } on DioError catch (error) {
      return ErrorResult.fromErrorResponse(error.response);
    }

    return const SuccessResult(null);
  }
}
