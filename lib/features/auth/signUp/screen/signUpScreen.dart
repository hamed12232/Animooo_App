import 'dart:io';

import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/functions/app_validators.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:animoo_app/core/widget/custom_animoo_logo_app.dart';
import 'package:animoo_app/core/widget/custom_attribute_text_field.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/core/widget/custom_password_text_field.dart';
import 'package:animoo_app/features/auth/login/screen/loginScreen.dart';
import 'package:animoo_app/core/widget/custom_rich_text_button.dart';
import 'package:animoo_app/features/auth/signUp/widget/custom_password_rules.dart';
import 'package:animoo_app/features/auth/signUp/widget/custom_rounded_rectangle_border.dart';
import 'package:flutter/material.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});
  static const String routeName = '/signUP';

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController firstNameEditingController =
      TextEditingController();
  final TextEditingController lastNameEditingController =
      TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordEditingController =
      TextEditingController();
  final TextEditingController phoneNumberEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? imageFile;
  @override
  void dispose() {
    emailEditingController.dispose();
    firstNameEditingController.dispose();
    lastNameEditingController.dispose();
    passwordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    phoneNumberEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroungColor,
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAnimooLogoApp(),
                VerticalSpace(height: AppHeight.h30),
                SizedBox(
                  height: AppHeight.h93,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: FontValues.otamaEp,
                      color: AppColors.kblackColor,
                      fontSize: AppFontsSize.s38,
                    ),
                  ),
                ),
                CustomAttributeTextField(
                  attribute: "First Name",
                  attributeEditingController: firstNameEditingController,
                  validator: (value)=>  AppValidators.firstNameValidator(value),
                ),
                VerticalSpace(height: AppHeight.h16),
                CustomAttributeTextField(
                  attribute: "Last Name",
                  attributeEditingController: lastNameEditingController,
                  validator: (value) => AppValidators.lastNameValidator(value),
                ),
                VerticalSpace(height: AppHeight.h16),
                CustomAttributeTextField(
                  attribute: "Email",
                  attributeEditingController: emailEditingController,
                  validator: (value) => AppValidators.emailValidator(value),
                ),
                VerticalSpace(height: AppHeight.h16),
                CustomAttributeTextField(
                  attribute: "Phone Number",
                  attributeEditingController: phoneNumberEditingController,
                  validator: (value) => AppValidators.phoneValidator(value),
                ),
                VerticalSpace(height: AppHeight.h16),
                CustomPasswordTextField(
                  passwordEditingController: passwordEditingController,
                  text: "Password",
                  validator: (value) => AppValidators.passwordValidator(value),
                ),
                VerticalSpace(height: AppHeight.h8),
                Text(
                  "Please add all necessary characters to create safe password.",
                  style: TextStyle(
                    fontFamily: FontValues.poppins,
                    color: AppColors.kannotationPasswordColor,
                    fontSize: AppFontsSize.s10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                VerticalSpace(height: AppHeight.h11),
                CustomPasswordRules(
                  rulesColor: AppColors.krulesOfPasswordColor,
                  rulesText: " At least 12 characters",
                ),
                VerticalSpace(height: AppHeight.h5),
                CustomPasswordRules(
                  rulesColor: AppColors.krulesOfPasswordColor,
                  rulesText: " At least 1 uppercase letter",
                ),
                VerticalSpace(height: AppHeight.h5),
                CustomPasswordRules(
                  rulesColor: AppColors.krulesOfPasswordColor,
                  rulesText: " At least 1 lowercase letter",
                ),
                VerticalSpace(height: AppHeight.h5),
                CustomPasswordRules(
                  rulesColor: AppColors.krulesOfPasswordColor,
                  rulesText: " At least 1 Special Character",
                ),
                VerticalSpace(height: AppHeight.h5),
                CustomPasswordRules(
                  rulesColor: AppColors.krulesOfPasswordColor,
                  rulesText: " At least 1 Number",
                ),
                VerticalSpace(height: AppHeight.h16),
                CustomPasswordTextField(
                  passwordEditingController: confirmPasswordEditingController,
                  text: "Confirm Password",
                  validator: (value) => AppValidators.confirmPasswordValidator(passwordEditingController.text,value),
                ),
                VerticalSpace(height: AppHeight.h16),
                Padding(
                  padding: EdgeInsets.only(left: PAdding.kPadding22),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Uploading Profile Picture",
                      style: TextStyle(
                        fontFamily: FontValues.poppins,
                        color: AppColors.kTextFieldHintColor,
                        fontSize: AppFontsSize.s16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                VerticalSpace(height: AppHeight.h8),
                CustomRoundedRectDottedBorder(),

                VerticalSpace(height: AppHeight.h30),
                CustomButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Handle the sign-up logic here
                      // For example, you can call a sign-up API
                      // and navigate to the next screen on success.
                    }
                  },
                  text: "Sign Up",
                  fontSize: AppFontsSize.s14,
                ),
                VerticalSpace(height: AppHeight.h8),
                CustomRichTextButton(
                  subTextBottomTitle: "Already have an account? ",
                  textButtonTitle: "Log in",
                  routeName: Loginscreen.routeName,
                ),
                VerticalSpace(height: AppHeight.h20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
