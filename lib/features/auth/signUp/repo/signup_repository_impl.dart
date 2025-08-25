import 'dart:io';
import 'package:animoo_app/core/api/api_constant.dart';
import 'package:animoo_app/core/api/dio_services.dart';
import 'package:animoo_app/core/errors/error_model.dart';
import 'package:animoo_app/core/errors/failures.dart';
import 'package:animoo_app/features/auth/signUp/models/signup_model.dart';
import 'package:animoo_app/features/auth/signUp/repo/signup_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignupRepositoryImpl implements SignupRepository {
  final DioServices _dioServices;
  SignupRepositoryImpl(this._dioServices);

  @override
  Future<Either<ServerFailure, AuthResponse>> signup(
    UserResponseModel model,
    String password,
  ) async {
    try {
      // Validate image path
      if (model.imagePath == null || model.imagePath!.isEmpty) {
        return Left(ServerFailure(
          ErrorModel(error: ["Profile image is required"], code: 400),
        ));
      }

      // Check if file exists
      final file = File(model.imagePath!);
      if (!await file.exists()) {
        return Left(ServerFailure(
          ErrorModel(error: ["Profile image file not found"], code: 400),
        ));
      }

      final response = await _dioServices.post(
        url: ApiConstant.signUp,
        body: {
          ApiKeys.firstName: model.firstName,
          ApiKeys.lastName: model.lastName,
          ApiKeys.email: model.email,
          ApiKeys.password: password,
          ApiKeys.phoneNumber: model.phone,
          ApiKeys.image: await MultipartFile.fromFile(
            model.imagePath!,
            filename: model.imagePath!.split("/").last,
          ),
        },
      );
      return Right(AuthResponse.fromJson(response));
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return Left(ServerFailure(ErrorModel.fromJson(e.response?.data)));
      } else {
        return Left(
          ServerFailure(
            ErrorModel(error: [e.message ?? "Something went wrong"], code: 500),
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailure(ErrorModel(error: [e.toString()], code: 500)));
    }
  }
}
