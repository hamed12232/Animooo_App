import 'dart:developer';

import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/features/auth/login/screen/loginScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichTextButton extends StatelessWidget {
  const CustomRichTextButton({
    super.key,
    required this.subTextBottomTitle,
    required this.textButtonTitle,
    required this.routeName,
  });
  final String subTextBottomTitle;
  final String textButtonTitle;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: subTextBottomTitle,
            style: TextStyle(
              color: AppColors.kDonotHaveAccountColor,
              fontFamily: FontValues.poppins,
              fontSize: AppFontsSize.s14,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: textButtonTitle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (routeName == Loginscreen.routeName) {
                  Navigator.of(context).pop();
                  log("Navigating to Sign Up Screen");
                } else {
                  Navigator.pushNamed(context, routeName);
                }
              },
            style: TextStyle(
              color: AppColors.kprimaryColor,
              fontFamily: FontValues.poppins,
              decoration: TextDecoration.underline,
              fontSize: AppFontsSize.s14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
