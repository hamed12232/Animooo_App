import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/features/auth/login/screen/createNewPassword.dart';
import 'package:animoo_app/features/auth/login/widgets/custom_app_bar_verification.dart';
import 'package:animoo_app/features/auth/login/widgets/custom_pin_code_text_field.dart';
import 'package:animoo_app/features/auth/login/widgets/custom_title_subTitle_verification.dart';
import 'package:flutter/material.dart';

class Otpverificationscreen extends StatelessWidget {
  const Otpverificationscreen({super.key});
  static const String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroungColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarVerification(text: "Cancel"),
            VerticalSpace(height: AppHeight.h16),
            CustomTitleAndSubTitleVerficiation(
              title: "OTP Verification",
              subtitle: "Please enter the 4 digit code sent your phone number",
            ),
            VerticalSpace(height: AppHeight.h54),
            CustomPinCodeTextField(),
            VerticalSpace(height: AppHeight.h41),
            CustomButton(
              text: "Confirm",
              onPressed: () {
                Navigator.of(context).pushNamed(Createnewpassword.routeName);
              },
            ),
            VerticalSpace(height: AppHeight.h8),
            Text(
              "Resend Code In 00:59",
              style: TextStyle(
                color: AppColors.kgreyColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
