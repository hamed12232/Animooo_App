import 'dart:developer';

import 'package:animoo_app/core/database/api/api_constant.dart';
import 'package:animoo_app/core/database/api/dio_services.dart';
import 'package:animoo_app/core/database/local/flutter_secure.dart';
import 'package:animoo_app/core/errors/error_model.dart';
import 'package:animoo_app/core/errors/failures.dart';
import 'package:animoo_app/features/auth/login/models/login_model.dart';
import 'package:animoo_app/features/auth/login/repo/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositioryImp implements LoginRepository {
  LoginRepositioryImp(this._dioServices);

  final DioServices _dioServices;
  @override
  Future<Either<String, String>> forgetPassword(String email) async {
    try {
      final response = await _dioServices.post(
        url: ApiConstant.forgetPassword,
        body: {ApiKeys.email: email},
      );
      log(response.toString());
      if (response["message"].toString() == "Email sent successfully") {
        return Right("Email sent successfully");
      } else {
        return Left(response["message"].toString());
      }
    } on ServerFailure catch (e) {
      return Left(e.errorModel.error.toString());
    }
  }

  @override
  Future<Either<ErrorModel, LoginModel>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await _dioServices.get(
        url: ApiConstant.getLoginUrl(email, password),
      );
      final loginMode = LoginModel.fromJson(response);
      FlutterSecureDatabase.setSecuredString(
        ApiKeys.accessToken,
        loginMode.accessToken!,
      );
      FlutterSecureDatabase.setSecuredString(
        ApiKeys.refreshToken,
        loginMode.refreshToken!,
      );

      return Right(loginMode);
    } on ServerFailure catch (e) {
      return Left(e.errorModel);
    } catch (e) {
      return Left(ErrorModel(error: [e.toString()], code: 500));
    }
  }

  @override
  Future<Either<ErrorModel, LoginModel>> createNewPassword(
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      final response = await _dioServices.post(
        url: ApiConstant.createNewPassword,
        body: {
          ApiKeys.email: email,
          ApiKeys.password: password,
          ApiKeys.confirmPassword: confirmPassword,
        },
      );
      log(response.toString());
      return Right(LoginModel.fromJson(response));
    } on ServerFailure catch (e) {
      return Left(e.errorModel);
    } catch (e) {
      return Left(ErrorModel(error: [e.toString()], code: 500));
    }
  }
}
