import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/core/widget/custom_password_text_field.dart';
import 'package:animoo_app/features/auth/login/widgets/custom_app_bar_verification.dart';
import 'package:animoo_app/features/auth/signUp/widget/custom_password_rules.dart';
import 'package:flutter/material.dart';

class Createnewpassword extends StatelessWidget {
  Createnewpassword({super.key});
  static const String routeName = '/createNewPassword';
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroungColor,

      body: Column(
        children: [
          CustomAppBarVerification(text: "Cancel"),
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
            passwordEditingController: passwordEditingController,
            text: "New Password",
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
          ),
          VerticalSpace(height: AppHeight.h82),
          CustomButton(
            text: "Submit",
            onPressed: () {
              // Add your confirmation logic here
            },
          ),
        ],
      ),
    );
  }
}
