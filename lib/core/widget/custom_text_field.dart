import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.isObsecure,
    required this.controller,
    this.validator,
    this.onTap,
  });
  final String hintText;
  final bool isObsecure;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: 331.w,
      child: TextFormField(
        // style: TextStyle(color: AppColors.kgreyColor),
        obscureText: isObsecure,
        obscuringCharacter: '*',
        validator: validator,
        controller: controller,
        onTap: onTap,
        onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.kgreyColor,
            fontSize: AppFontsSize.s12,
          ),
          suffixIcon: suffixIcon,

          filled: true,
          fillColor: AppColors.kTextFieldColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColors.kTextFieldColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColors.kTextFieldColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColors.kprimaryColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
