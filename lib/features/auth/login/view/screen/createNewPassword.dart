import 'dart:async';

import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/functions/app_on_change_password.dart';
import 'package:animoo_app/core/models/password_rules.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/core/widget/custom_password_text_field.dart';
import 'package:animoo_app/features/auth/login/view/widgets/custom_app_bar_verification.dart';
import 'package:animoo_app/features/auth/signUp/views/widget/custom_list_view_password_rules.dart';
import 'package:flutter/material.dart';

class Createnewpassword extends StatefulWidget {
  const Createnewpassword({super.key});
  static const String routeName = '/createNewPassword';

  @override
  State<Createnewpassword> createState() => _CreatenewpasswordState();
}

class _CreatenewpasswordState extends State<Createnewpassword> {
  final TextEditingController passwordEditingController =
      TextEditingController();

  final TextEditingController confirmPasswordEditingController =
      TextEditingController();

  late Stream<List<PasswordRulesModel>> listPasswordRulesOutPutStream;
  late StreamController<List<PasswordRulesModel>> listPasswordRulesController;
  @override

  void initState() {
    listPasswordRulesController = StreamController<List<PasswordRulesModel>>();
    listPasswordRulesInput = listPasswordRulesController.sink;
    listPasswordRulesOutPutStream = listPasswordRulesController.stream;
    super.initState();
  }

  @override
  void dispose() {
    listPasswordRulesController.close();
    listPasswordRulesInput.close();
    super.dispose();
  }
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
            CustomListViewPasswordRequiredRules(
              stream: listPasswordRulesOutPutStream,
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
      ),
    );
  }
}
