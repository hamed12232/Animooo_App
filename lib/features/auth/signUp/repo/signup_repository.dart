import 'package:animoo_app/core/errors/failures.dart';
import 'package:animoo_app/features/auth/signUp/models/signup_model.dart';
import 'package:dartz/dartz.dart';

abstract class SignupRepository {
  Future<Either<ServerFailure, AuthResponse>>  signup(UserResponseModel model,String password);
  
}