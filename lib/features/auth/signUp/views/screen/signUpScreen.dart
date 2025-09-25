import 'dart:async';

import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/functions/app_on_change_password.dart';
import 'package:animoo_app/core/functions/app_validators.dart';
import 'package:animoo_app/core/models/password_rules.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:animoo_app/core/widget/custom_animoo_logo_app.dart';
import 'package:animoo_app/core/widget/custom_attribute_text_field.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/core/widget/custom_password_text_field.dart';
import 'package:animoo_app/core/widget/custom_rich_text_button.dart';
import 'package:animoo_app/core/widget/custom_rounded_rectangle_border.dart';
import 'package:animoo_app/features/auth/login/view/screen/loginScreen.dart';
import 'package:animoo_app/features/auth/signUp/view_models/signup_state.dart';
import 'package:animoo_app/features/auth/signUp/view_models/signup_viewmodel.dart';
import 'package:animoo_app/features/auth/signUp/views/screen/otpVerificationScreen.dart';
import 'package:animoo_app/features/auth/signUp/views/widget/custom_list_view_password_rules.dart';
import 'package:animoo_app/features/auth/signUp/views/widget/password_rules_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});
  static const String routeName = '/signUP';

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  late Stream<List<PasswordRulesModel>> listPasswordRulesOutPutStream;
  late StreamController<List<PasswordRulesModel>> listPasswordRulesController;
  late SignupViewmodel viewModel;

  @override
  void initState() {
    super.initState();
    listPasswordRulesController =
        StreamController<List<PasswordRulesModel>>.broadcast();
    listPasswordRulesOutPutStream = listPasswordRulesController.stream;

    // Set up the callback for password rules updates
    setPasswordRulesCallback((rules) {
      if (!listPasswordRulesController.isClosed) {
        listPasswordRulesController.add(rules);
      }
    });

    viewModel = context.read<SignupViewmodel>();
  }

  @override
  void dispose() {
    clearPasswordRulesCallback();
    if (!listPasswordRulesController.isClosed) {
      listPasswordRulesController.close();
    }
    viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroungColor,
      body: SafeArea(
        child: Center(
          child: BlocConsumer<SignupViewmodel, SignupState>(
            listener: (BuildContext context, state) {
              if (state is SignupSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.authResponse.alert!)),
                );
                Navigator.of(context).pushNamed(
                  Otpverificationscreen.routeName,
                  arguments: state.authResponse.user!.email,
                );
              } else if (state is SignupError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (BuildContext context, state) {
              if (state is SignupLoading) {
                return CircularProgressIndicator(
                  color: AppColors.kprimaryColor,
                );
              }
              return Form(
                key: viewModel.formKey,
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
                        attributeEditingController:
                            viewModel.firstNameEditingController,
                        validator: (value) =>
                            AppValidators.firstNameValidator(value),
                      ),
                      VerticalSpace(height: AppHeight.h16),
                      CustomAttributeTextField(
                        attribute: "Last Name",
                        attributeEditingController:
                            viewModel.lastNameEditingController,
                        validator: (value) =>
                            AppValidators.lastNameValidator(value),
                      ),
                      VerticalSpace(height: AppHeight.h16),
                      CustomAttributeTextField(
                        attribute: "Email",
                        attributeEditingController:
                            viewModel.emailEditingController,
                        validator: (value) =>
                            AppValidators.emailValidator(value),
                      ),
                      VerticalSpace(height: AppHeight.h16),
                      CustomAttributeTextField(
                        attribute: "Phone Number",
                        attributeEditingController:
                            viewModel.phoneNumberEditingController,
                        validator: (value) =>
                            AppValidators.phoneValidator(value),
                      ),
                      VerticalSpace(height: AppHeight.h16),
                      CustomPasswordTextField(
                        passwordEditingController:
                            viewModel.passwordEditingController,
                        text: "Password",
                        onChanged: (value) => onChangePassword(value),
                      ),
                      VerticalSpace(height: AppHeight.h8),

                      PasswordRulesStreamBuilder(
                        listPasswordRulesOutPutStream:
                            listPasswordRulesOutPutStream,
                      ),
                      VerticalSpace(height: AppHeight.h11),
                      CustomListViewPasswordRequiredRules(
                        stream: listPasswordRulesOutPutStream,
                      ),
                      VerticalSpace(height: AppHeight.h16),
                      CustomPasswordTextField(
                        passwordEditingController:
                            viewModel.confirmPasswordEditingController,
                        text: "Confirm Password",
                        validator: (value) =>
                            AppValidators.confirmPasswordValidator(
                              viewModel.passwordEditingController.text,
                              value,
                            ),
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
                      CustomRoundedRectDottedBorder(
                        onTap: () async {
                          {
                            await viewModel.pickImage(context);

                            setState(() {});
                          }
                        },
                        imageFile: viewModel.imageFile,
                      ),

                      VerticalSpace(height: AppHeight.h30),
                      CustomButton(
                        onPressed: () async => await viewModel.signup(),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
