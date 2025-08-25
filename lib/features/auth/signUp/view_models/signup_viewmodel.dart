import 'dart:io';

import 'package:animoo_app/core/errors/failures.dart';
import 'package:animoo_app/features/auth/signUp/models/signup_model.dart';
import 'package:animoo_app/features/auth/signUp/repo/signup_repository_impl.dart';
import 'package:animoo_app/features/auth/signUp/view_models/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewmodel extends Cubit<SignupState> {
  SignupViewmodel(this.signupRepositoryImpl) : super(SignupInitial());
  final SignupRepositoryImpl signupRepositoryImpl;
  final emailEditingController = TextEditingController();
  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? imageFile;
  Future<void> signup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      emit(SignupLoading());
      var userModel = UserResponseModel(
        firstName: firstNameEditingController.text,
        lastName: lastNameEditingController.text,
        email: emailEditingController.text,
        phone: phoneNumberEditingController.text,
        imagePath: imageFile!.path,
      );
      final response = await signupRepositoryImpl.signup(
        userModel,
        passwordEditingController.text,
      );
     response.fold(
        (failure) => emit(SignupError(failure.errorModel.error.toString())),
        (authResponse) => emit(SignupSuccess(authResponse: authResponse)),
      );
    } on ServerFailure catch (e) {
      emit(SignupError(e.errorModel.error.toString()));
    }
  }
}
