import 'package:animoo_app/features/auth/login/repo/login_repository.dart';
import 'package:animoo_app/features/auth/login/view_model/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  ForgetPasswordViewModel(this.loginRepositiory)
    : super(ForgetPasswordInitial());

  final LoginRepository loginRepositiory;
  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    final response = await loginRepositiory.forgetPassword(email);
    response.fold(
      (failure) => emit(ForgetPasswordError(failure)),
      (message) => emit(ForgetPasswordSuccess(message)),
    );
  }

  Future<void> createNewPassword(
    String email,
    String password,
    String confirmPassword,
  ) async {
    emit(ForgetPasswordLoading());
    final response = await loginRepositiory.createNewPassword(
      email,
      password,
      confirmPassword,
    );
    response.fold(
      (failure) => emit(ForgetPasswordError(failure.error.toString())),
      (loginModel) => emit(CreateNewPasswordSuccess(loginModel)),
    );
  }
}
