import 'package:animoo_app/features/auth/login/models/login_model.dart';

abstract class ForgetPasswordState {}

class ForgetPassword extends ForgetPasswordState {}
class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;
  ForgetPasswordSuccess(this.message);
}
class CreateNewPasswordSuccess extends ForgetPasswordState {
  final LoginModel loginModel;
  CreateNewPasswordSuccess(this.loginModel);
}
class ForgetPasswordError extends ForgetPasswordState {
  final String error;
  ForgetPasswordError(this.error);
}

class ForgetPasswordLoading extends ForgetPasswordState {}
