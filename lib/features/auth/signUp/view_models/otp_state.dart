import 'package:animoo_app/features/auth/login/models/login_model.dart';

abstract class OtpState {}

class OtpInitial extends OtpState {
    String code;
    OtpInitial({this.code=""});

}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {
  final LoginModel loginModel;
  OtpSuccess(this.loginModel);

}

class OtpError extends OtpState {
  final String message;
  OtpError(this.message);
}
