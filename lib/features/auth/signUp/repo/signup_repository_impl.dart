import 'dart:developer';

import 'package:animoo_app/core/api/api_constant.dart';
import 'package:animoo_app/core/api/dio_services.dart';
import 'package:animoo_app/core/errors/error_model.dart';
import 'package:animoo_app/core/errors/failures.dart';
import 'package:animoo_app/features/auth/login/models/login_model.dart';
import 'package:animoo_app/features/auth/signUp/models/signup_model.dart';
import 'package:animoo_app/features/auth/signUp/repo/signup_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignupRepositoryImpl implements SignupRepository {
  final DioServices _dioServices;
  SignupRepositoryImpl(this._dioServices);

  @override
  Future<Either<ErrorModel, AuthResponse>> signup(
    String firstName,
    String lastName,
    String email,
    String phone,
    String imagePath,
    String password,
  ) async {
    try {
      final String fileName = imagePath.split('/').isNotEmpty
          ? imagePath.split('/').last
          : (imagePath.split('\\').isNotEmpty
                ? imagePath.split('\\').last
                : 'image.jpg'); // get the file name

      final formData = FormData.fromMap({
        ApiKeys.firstName: firstName,
        ApiKeys.lastName: lastName,
        ApiKeys.email: email,
        ApiKeys.phoneNumber: phone,
        ApiKeys.password: password,
        ApiKeys.image: await MultipartFile.fromFile(
          imagePath,
          filename: fileName,
        ),
      }); // create form data

      final response = await _dioServices.post(
        url: ApiConstant.signUp,
        body: formData,
      );
      log(response.toString());
      return Right(AuthResponse.fromJson(response));
    } on ServerFailure catch (e) {
      return Left(e.errorModel);
    } catch (e) {
      return Left(ErrorModel(error: [e.toString()], code: 500));
    }
  }

  @override
  Future<Either<ErrorModel, LoginModel>> verifyOtp(
    String email,
    String otp,
  ) async {
    try {
      final response = await _dioServices.post(
        url: ApiConstant.verifyOtp,
        body: {ApiKeys.email: email, ApiKeys.code: otp},
      );
      log(response.toString());
      return Right(LoginModel.fromJson(response));
    } on ServerFailure catch (e) {
      return Left(e.errorModel);
    } catch (e) {
      return Left(ErrorModel(error: [e.toString()], code: 500));
    }
  }

  @override
  Future<Either<ErrorModel, String>> resendOtp(String email) async{
    try {
      final response = await _dioServices.post(
        url: ApiConstant.resendOtp,
        body: {ApiKeys.email: email},
      );
      return Right(response["message"].toString());
    } on ServerFailure catch (e) {
      return Left(e.errorModel);
    } catch (e) {
      return Left(ErrorModel(error: [e.toString()], code: 500));
    }
  }
}
