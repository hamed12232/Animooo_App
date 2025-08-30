import 'package:animoo_app/core/DI/get_it.dart';
import 'package:animoo_app/features/auth/login/view/screen/createNewPassword.dart';
import 'package:animoo_app/features/auth/login/view/screen/forgetPasswordScreen.dart';
import 'package:animoo_app/features/auth/login/view/screen/loginScreen.dart';
import 'package:animoo_app/features/auth/login/view_model/forget_password_view_model.dart';
import 'package:animoo_app/features/auth/login/view_model/login_view_model.dart';
import 'package:animoo_app/features/auth/signUp/view_models/signup_viewmodel.dart';
import 'package:animoo_app/features/auth/signUp/views/screen/otpVerificationScreen.dart';
import 'package:animoo_app/features/auth/signUp/views/screen/signUpScreen.dart';
import 'package:animoo_app/features/home/view/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouteManager {
  static Route? onGenerateRoute(RouteSettings settings) {
    Widget widget;
    switch (settings.name) {
      case AppRoutesName.login:
        widget = BlocProvider(create: (context) => sl<LoginViewModel>(), child: Loginscreen());
      case AppRoutesName.signUP:
        widget = BlocProvider(create: (context) => sl<SignupViewmodel>(), child: Signupscreen());
      case AppRoutesName.forgetPassword:
        widget = BlocProvider(create: (context) => sl<ForgetPasswordViewModel>(), child: ForgetPasswordScreen());
      case AppRoutesName.otb:
        final args = settings.arguments as Map<String, dynamic>;

        widget = Otpverificationscreen(
          email: args["email"],
          isFromForgotPassword: args["isFromForgotPassword"] ?? false,
        );
      case AppRoutesName.createNewPassword:
        widget = BlocProvider(
          create: (context) => sl<ForgetPasswordViewModel>(),
          child: CreateNewPassword(email: settings.arguments as String),
        );
      case AppRoutesName.home:
        widget = HomeScreen();
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
  static const String createNewPassword = '/CreateNewPassword';
  static const String home = '/home';
}
