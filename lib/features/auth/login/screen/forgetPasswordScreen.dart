import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/widget/custom_attribute_text_field.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/features/auth/login/screen/otpVerificationScreen.dart';
import 'package:animoo_app/features/auth/login/widgets/custom_app_bar_verification.dart';
import 'package:animoo_app/features/auth/login/widgets/custom_title_subTitle_verification.dart';
import 'package:flutter/material.dart';

class Forgetpasswordscreen extends StatelessWidget {
  Forgetpasswordscreen({super.key});
  static const String routeName = '/forgetPassword';
  final TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroungColor,
      body: Column(
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
          ),
          VerticalSpace(height: AppHeight.h151),
          CustomButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Otpverificationscreen.routeName);
            },
            text: "Send Code",
            fontSize: AppFontsSize.s14,
          ),
        ],
      ),
    );
  }
}
