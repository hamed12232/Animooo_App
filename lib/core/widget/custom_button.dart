import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,

    this.fontSize = 16,
    this.buttonColor = AppColors.kprimaryColor,
    this.textColor = AppColors.kbackGroungColor,
    this.isButtonImageSelector = false, this.borderRadius,
  });
  final void Function()? onPressed;
  final String text;
  final double fontSize;
  final Color buttonColor;
  final Color textColor;
  final bool isButtonImageSelector;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: buttonColor,

        shape: RoundedRectangleBorder(borderRadius: borderRadius??BorderRadius.circular(8.r)),
        fixedSize: !isButtonImageSelector ? Size(331.w, 56.h) : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize.sp,
          fontFamily: FontValues.poppins,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
