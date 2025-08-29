import 'dart:developer';

import 'package:animoo_app/core/api/api_constant.dart';
import 'package:animoo_app/core/api/dio_services.dart';
import 'package:animoo_app/core/errors/failures.dart';
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
  Future<void> login(String email, String password) {
    throw UnimplementedError();
  }
}
