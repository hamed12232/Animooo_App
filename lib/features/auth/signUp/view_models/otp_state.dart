import 'package:animoo_app/features/auth/login/models/login_model.dart';

abstract class OtpState {
  final String code;
  const OtpState({this.code = ""});
}

class OtpInitial extends OtpState {
  const OtpInitial({super.code});
}

class OtpLoading extends OtpState {
  const OtpLoading({required super.code});
}

class OtpSuccess extends OtpState {
  final LoginModel loginModel;
  const OtpSuccess({
    required this.loginModel,
    required super.code,
  });
}

class OtpResend extends OtpState {
  final String message;
  const OtpResend(this.message, {super.code});
}

class OtpError extends OtpState {
  final String message;
  const OtpError({
    required this.message,
    required super.code,
  });
}
