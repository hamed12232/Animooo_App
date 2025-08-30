import 'package:animoo_app/features/auth/signUp/repo/signup_repository.dart';
import 'package:animoo_app/features/auth/signUp/view_models/otp_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpViewmodel extends Cubit<OtpState> {
  OtpViewmodel(this.signupRepository) : super(const OtpInitial());
  final SignupRepository signupRepository;

  Future<void> verifyOtp(String email, String otp) async {
    if (state.code.isEmpty) return;

    emit(OtpLoading(code: state.code));

    final response = await signupRepository.verifyOtp(email, otp);
    response.fold(
      (failure) =>
          emit(OtpError(message: failure.error.toString(), code: state.code)),
      (loginModel) =>
          emit(OtpSuccess(loginModel: loginModel, code: state.code)),
    );
  }

  Future<void> resendOtp(String email) async {
    emit(OtpLoading(code: state.code));
    final response = await signupRepository.resendOtp(email);
    response.fold(
      (failure) =>
          emit(OtpError(message: failure.error.toString(), code: state.code)),
      (message) => emit(OtpResend(message, code: state.code)),
    );
  }

  void updateCode(String value) {
    emit(OtpInitial(code: value));
  }
}
