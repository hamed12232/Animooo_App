import 'dart:developer';

import 'package:animoo_app/features/auth/login/repo/login_repository.dart';
import 'package:animoo_app/features/auth/login/view_model/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel(this.loginRepositiory) : super(LoginInitial());
  final LoginRepository loginRepositiory;
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    emit(LoginLoading());
    final response = await loginRepositiory.login(emailEditingController.text, passwordEditingController.text);
    log(response.toString());
    response.fold(
      (failure) => emit(LoginError(failure.error.toString())),
      (loginModel) => emit(LoginSuccess(loginModel)),
    );
  }
}
