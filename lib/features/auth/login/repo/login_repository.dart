import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<void> login(String email, String password);
  Future<Either<String, String>>forgetPassword(String email);
}