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
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/core/widget/custom_password_text_field.dart';
import 'package:animoo_app/features/auth/login/view/screen/loginScreen.dart';
import 'package:animoo_app/features/auth/login/view/widgets/custom_app_bar_verification.dart';
import 'package:animoo_app/features/auth/login/view_model/forget_password_state.dart';
import 'package:animoo_app/features/auth/login/view_model/forget_password_view_model.dart';
import 'package:animoo_app/features/auth/signUp/views/widget/custom_list_view_password_rules.dart';
import 'package:animoo_app/features/auth/signUp/views/widget/password_rules_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key, required this.email});
  static const String routeName = '/CreateNewPassword';
  final String email;

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  late ForgetPasswordViewModel viewModel;

  late Stream<List<PasswordRulesModel>> listPasswordRulesOutPutStream;
  late StreamController<List<PasswordRulesModel>> listPasswordRulesController;

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

    viewModel = context.read<ForgetPasswordViewModel>();
  }

  @override
  void dispose() {
    clearPasswordRulesCallback();
    if (!listPasswordRulesController.isClosed) {
      listPasswordRulesController.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroungColor,
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              const CustomAppBarVerification(text: "Cancel"),
              VerticalSpace(height: AppHeight.h16),
              Padding(
                padding: const EdgeInsets.only(left: PAdding.kPadding18),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create New Password",
                    style: TextStyle(
                      fontFamily: FontValues.otamaEp,
                      color: AppColors.kprimaryColor,
                      fontSize: AppFontsSize.s20,
                    ),
                  ),
                ),
              ),
              VerticalSpace(height: AppHeight.h11),
              CustomPasswordTextField(
                passwordEditingController: viewModel.passwordEditingController,
                text: "New Password",
                onChanged: (value) => onChangePassword(value),
              ),
              VerticalSpace(height: AppHeight.h8),
              PasswordRulesStreamBuilder(
                listPasswordRulesOutPutStream: listPasswordRulesOutPutStream,
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
                validator: (value) => AppValidators.confirmPasswordValidator(
                  viewModel.passwordEditingController.text,
                  value,
                ),
              ),
              VerticalSpace(height: AppHeight.h82),
              BlocConsumer<ForgetPasswordViewModel, ForgetPasswordState>(
                listener: (context, state) {
                  if (state is ForgetPasswordError) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error)));
                  } else if (state is CreateNewPasswordSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.loginModel.message!)),
                    );
                    Navigator.of(context).pushNamed(Loginscreen.routeName);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: "Submit",
                    onPressed: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        viewModel.createNewPassword(
                          widget.email,
                          viewModel.passwordEditingController.text,
                          viewModel.confirmPasswordEditingController.text,
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
