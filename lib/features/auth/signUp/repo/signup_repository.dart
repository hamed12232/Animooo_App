import 'package:animoo_app/core/errors/error_model.dart';
import 'package:animoo_app/features/auth/login/models/login_model.dart';
import 'package:animoo_app/features/auth/signUp/models/signup_model.dart';
import 'package:dartz/dartz.dart';

abstract class SignupRepository {
  Future<Either<ErrorModel, AuthResponse>> signup(
    String firstName,
    String lastName,
    String email,
    String phone,
    String imagePath,
    String password,
  );
  Future<Either<ErrorModel, LoginModel>> verifyOtp(String email, String otp);
  Future<Either<ErrorModel, String>> resendOtp(String phone);
}
