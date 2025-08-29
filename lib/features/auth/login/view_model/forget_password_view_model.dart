import 'package:animoo_app/features/auth/login/repo/login_repositiory_imp.dart';
import 'package:animoo_app/features/auth/login/view_model/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  ForgetPasswordViewModel(this.loginRepositioryImp) : super(ForgetPasswordInitial());

  final LoginRepositioryImp loginRepositioryImp ;
  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    final response = await loginRepositioryImp.forgetPassword(email);
    response.fold(
      (failure) => emit(ForgetPasswordError(failure)),
      (message) => emit(ForgetPasswordSuccess(message)),
    );
  }

}
