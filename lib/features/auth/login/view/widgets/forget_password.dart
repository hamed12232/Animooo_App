import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:animoo_app/features/auth/login/view/screen/forgetPasswordScreen.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Forgetpasswordscreen.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: PAdding.kPadding35),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Forget Password....?",
            style: TextStyle(
              color: AppColors.kprimaryColor,
              fontFamily: FontValues.poppins,
              fontWeight: FontWeight.normal,
              fontSize: AppFontsSize.s11,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
