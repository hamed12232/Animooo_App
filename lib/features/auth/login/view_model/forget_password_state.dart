import 'package:animoo_app/features/auth/login/view_model/login_state.dart';


class ForgetPassword extends LoginState {}
class ForgetPasswordSuccess extends LoginState {
  final String message;
  ForgetPasswordSuccess(this.message);
}
class ForgetPasswordError extends LoginState {
  final String error;
  ForgetPasswordError(this.error);
}
class ForgetPasswordLoading extends LoginState {}