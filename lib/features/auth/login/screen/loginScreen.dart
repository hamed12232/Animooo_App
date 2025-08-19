import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/services/internet_checker.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/core/widget/custom_attribute_text_field.dart';
import 'package:animoo_app/core/widget/custom_password_text_field.dart';
import 'package:animoo_app/core/widget/custom_animoo_logo_app.dart';
import 'package:animoo_app/core/widget/custom_rich_text_button.dart';
import 'package:animoo_app/features/auth/login/widgets/forget_password.dart';
import 'package:animoo_app/features/auth/signUp/screen/signUpScreen.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});
  static const String routeName = '/';

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kbackGroungColor,
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const CustomAnimooLogoApp(),
                VerticalSpace(height: AppHeight.h30),
                SizedBox(
                  height: AppHeight.h93,
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      fontFamily: FontValues.otamaEp,
                      color: AppColors.kblackColor,
                      fontSize: AppFontsSize.s38,
                    ),
                  ),
                ),

                CustomAttributeTextField(
                  attribute: "Email",
                  attributeEditingController: emailEditingController,
                ),
                VerticalSpace(height: AppHeight.h16),
                CustomPasswordTextField(
                  passwordEditingController: passwordEditingController,
                  text: "Password",
                ),

                VerticalSpace(height: AppHeight.h8),
                ForgetPassword(),
                VerticalSpace(height: AppHeight.h30),
                CustomButton(
                  onPressed: () async {
                    var result = InternetChecker();
                    bool isConnected = await result();
                    print('isConnected: $isConnected');
                  },
                  text: "Log In",
                  fontSize: AppFontsSize.s14,
                ),
                VerticalSpace(height: AppHeight.h257),
                const CustomRichTextButton(
                  subTextBottomTitle: "Don’t have an account? ",
                  textButtonTitle: "Sign up now",
                  routeName: Signupscreen.routeName,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
