import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/functions/app_validators.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/widget/custom_animoo_logo_app.dart';
import 'package:animoo_app/core/widget/custom_attribute_text_field.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/core/widget/custom_password_text_field.dart';
import 'package:animoo_app/core/widget/custom_rich_text_button.dart';
import 'package:animoo_app/features/auth/login/view/widgets/forget_password.dart';
import 'package:animoo_app/features/auth/login/view_model/login_state.dart';
import 'package:animoo_app/features/auth/login/view_model/login_view_model.dart';
import 'package:animoo_app/features/auth/signUp/views/screen/signUpScreen.dart';
import 'package:animoo_app/features/home/view/screen/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});
  static const String routeName = '/';

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  late LoginViewModel loginViewModel;

  @override
  void initState() {
    super.initState();
    loginViewModel = context.read<LoginViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kbackGroungColor,
        body: Center(
          child: Form(
            key: loginViewModel.formKey,
            child: SingleChildScrollView(
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
                    attributeEditingController:
                        loginViewModel.emailEditingController,
                    validator: (value) => AppValidators.emailValidator(value),
                  ),
                  VerticalSpace(height: AppHeight.h16),
                  CustomPasswordTextField(
                    passwordEditingController:
                        loginViewModel.passwordEditingController,
                    text: "Password",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Password is required";
                      } else {
                        return null;
                      }
                    },
                  ),

                  VerticalSpace(height: AppHeight.h8),
                  ForgetPassword(),
                  VerticalSpace(height: AppHeight.h30),
                  BlocConsumer<LoginViewModel, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.loginModel.message!)),
                        );
                        
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(MyHomePage.routeName);
                      } else if (state is LoginError) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    builder: (BuildContext context, state) {
                      if (state is LoginLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CustomButton(
                        onPressed: () async {
                          // var result =   InternetChecker();
                          // bool isConnected = await result();
                          // log('isConnected: $isConnected');
                          await loginViewModel.login();
                        },
                        text: "Log In",
                        fontSize: AppFontsSize.s14,
                      );
                    },
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
      ),
    );
  }
}
