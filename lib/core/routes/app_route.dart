import 'package:animoo_app/features/auth/login/screen/createNewPassword.dart';
import 'package:animoo_app/features/auth/login/screen/forgetPasswordScreen.dart';
import 'package:animoo_app/features/auth/login/screen/loginScreen.dart';
import 'package:animoo_app/features/auth/signUp/views/screen/otpVerificationScreen.dart';
import 'package:animoo_app/features/auth/signUp/views/screen/signUpScreen.dart';
import 'package:flutter/material.dart';

class AppRouteManager {
  static Route? onGenerateRoute(RouteSettings settings) {
    Widget widget;
    switch (settings.name) {
      case AppRoutesName.login:
        widget = Loginscreen();
      case AppRoutesName.signUP:
        widget = Signupscreen();
      case AppRoutesName.forgetPassword:
        widget = Forgetpasswordscreen();
      case AppRoutesName.otb:
        widget = Otpverificationscreen(email: settings.arguments as String);
      case AppRoutesName.createNewPassword:
        widget = Createnewpassword();
      default:
        widget = Loginscreen();
    }
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }
}

class AppRoutesName {
  static const String login = '/';
  static const String signUP = '/signUP';
  static const String forgetPassword = '/forgetPassword';
  static const String otb = "/otp";
  static const String createNewPassword = '/createNewPassword';
}
