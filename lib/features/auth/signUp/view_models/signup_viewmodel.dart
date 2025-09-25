// import 'dart:developer';
import 'dart:developer';
import 'dart:io';

import 'package:animoo_app/core/functions/select_image.dart';
import 'package:animoo_app/features/auth/signUp/repo/signup_repository.dart';
import 'package:animoo_app/features/auth/signUp/view_models/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewmodel extends Cubit<SignupState> {
  SignupViewmodel(this.signupRepository) : super(SignupInitial());
  final SignupRepository signupRepository;
  final emailEditingController = TextEditingController();
  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? imageFile;
  Future<void> signup() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    if (imageFile == null) {
      emit(SignupError("Please select a profile image"));
      return;
    }
    if (!(await imageFile!.exists())) {
      // Check if the file exists
      emit(SignupError("Selected image file not found on device"));
      return;
    }
    emit(SignupLoading());

    final response = await signupRepository.signup(
      firstNameEditingController.text,
      lastNameEditingController.text,
      emailEditingController.text,
      phoneNumberEditingController.text,
      imageFile!.path,
      passwordEditingController.text,
    );

    log(response.toString());
    response.fold(
      (failure) => emit(SignupError(failure.error.toString())),
      (authResponse) => emit(SignupSuccess(authResponse: authResponse)),
    );
  }

  @override
  Future<void> close() {
    emailEditingController.dispose();
    firstNameEditingController.dispose();
    lastNameEditingController.dispose();
    passwordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    phoneNumberEditingController.dispose();
    return super.close();
  }

  Future<void> pickImage(BuildContext context) async {
    await selectImage((image) => imageFile = image, context);
  }
}
