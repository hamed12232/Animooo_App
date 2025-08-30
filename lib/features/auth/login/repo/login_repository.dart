import 'package:animoo_app/core/errors/error_model.dart';
import 'package:animoo_app/features/auth/login/models/login_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<ErrorModel, LoginModel>> login(String email, String password);
  Future<Either<String, String>> forgetPassword(String email);
  Future<Either<ErrorModel, LoginModel>> createNewPassword(
    String email,
    String password,
    String confirmPassword,
  );
}
