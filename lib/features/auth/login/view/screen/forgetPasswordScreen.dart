import 'package:animoo_app/core/DI/get_it.dart';
import 'package:animoo_app/core/functions/app_validators.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/widget/custom_attribute_text_field.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/features/auth/login/view/widgets/custom_app_bar_verification.dart';
import 'package:animoo_app/features/auth/login/view/widgets/custom_title_subTitle_verification.dart';
import 'package:animoo_app/features/auth/login/view_model/forget_password_state.dart';
import 'package:animoo_app/features/auth/login/view_model/forget_password_view_model.dart';
import 'package:animoo_app/features/auth/signUp/views/screen/otpVerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Forgetpasswordscreen extends StatelessWidget {
  Forgetpasswordscreen({super.key});
  static const String routeName = '/forgetPassword';
  final TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ForgetPasswordViewModel>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kbackGroungColor,
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBarVerification(text: "Back"),
              VerticalSpace(height: AppFontsSize.s18),
              CustomTitleAndSubTitleVerficiation(
                title: "Forget Password",
                subtitle:
                    "Please enter the email address associated with your account, and we'll send you OTP to reset your password.",
              ),
              VerticalSpace(height: AppHeight.h58),
              CustomAttributeTextField(
                attributeEditingController: emailEditingController,
                attribute: "Email",
                validator: (value) => AppValidators.emailValidator(value),
              ),
              VerticalSpace(height: AppHeight.h151),
              BlocConsumer<ForgetPasswordViewModel, ForgetPasswordState>(
                builder: (BuildContext context, state) {
                  if (state is ForgetPasswordLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CustomButton(
                    onPressed: () {
                      if (emailEditingController.text.isNotEmpty) {
                        context.read<ForgetPasswordViewModel>().forgetPassword(
                          emailEditingController.text,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please enter email")),
                        );
                      }
                    },
                    text: "Send Code",
                    fontSize: AppFontsSize.s14,
                  );
                },
                listener: (BuildContext context, state) {
                  if (state is ForgetPasswordSuccess) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                    Navigator.of(context).pushNamed(
                      Otpverificationscreen.routeName,

                      arguments: {
                        "email": emailEditingController.text,
                        "isFromForgotPassword": true,
                      },
                    );
                  } else if (state is ForgetPasswordError) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
