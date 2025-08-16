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
  });
  final void Function()? onPressed;
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.kprimaryColor,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        fixedSize: Size(331.w, 56.h),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.kbackGroungColor,
          fontSize: fontSize.sp,
          fontFamily: FontValues.poppins,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
