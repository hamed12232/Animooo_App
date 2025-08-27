// import 'dart:developer';
import 'dart:io';

import 'package:animoo_app/features/auth/signUp/repo/signup_repository_impl.dart';
import 'package:animoo_app/features/auth/signUp/view_models/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignupViewmodel extends Cubit<SignupState> {
  SignupViewmodel(this.signupRepositoryImpl) : super(SignupInitial());
  final SignupRepositoryImpl signupRepositoryImpl;
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
      // Check if the form is valid
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

    final response = await signupRepositoryImpl.signup(
      firstNameEditingController.text,
      lastNameEditingController.text,
      emailEditingController.text,
      phoneNumberEditingController.text,
      imageFile!.path,
      passwordEditingController.text,
    );
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

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imageFile = File(image.path);
    }
  }
}
