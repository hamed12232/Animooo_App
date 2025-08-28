import 'package:animoo_app/features/auth/signUp/repo/signup_repository_impl.dart';
import 'package:animoo_app/features/auth/signUp/view_models/otp_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpViewmodel extends Cubit<OtpState> {
  OtpViewmodel(this.signupRepositoryImpl) : super(OtpInitial());
  final SignupRepositoryImpl signupRepositoryImpl;

  Future<void> verifyOtp(String email, String otp) async {
    if (state is OtpInitial) {
      final currentCode = (state as OtpInitial).code;
      if (currentCode.isEmpty) return;
    }
    emit(OtpLoading());
    final response = await signupRepositoryImpl.verifyOtp(email, otp);
    response.fold(
      (failure) => emit(OtpError(failure.error.toString())),
      (loginModel) => emit(OtpSuccess(loginModel)),
    );
  }

  void updateCode(String value) {
    if (state is OtpInitial) {
      emit(OtpInitial(code: value));
    }
  }
}
