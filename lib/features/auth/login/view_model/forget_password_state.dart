abstract class ForgetPasswordState {}

class ForgetPassword extends ForgetPasswordState {}
class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;
  ForgetPasswordSuccess(this.message);
}

class ForgetPasswordError extends ForgetPasswordState {
  final String error;
  ForgetPasswordError(this.error);
}

class ForgetPasswordLoading extends ForgetPasswordState {}
