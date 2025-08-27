import 'package:animoo_app/core/style/app_border_radius.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.isObsecure,
    required this.controller,
    this.validator,
    this.onTap, this.onChanged,
  });
  final String hintText;
  final bool isObsecure;
  final String? Function(String? value)? validator;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final void Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeight.h56,
      width: AppWidth.w331,
      child: TextFormField(
        // style: TextStyle(color: AppColors.kgreyColor),
        obscureText: isObsecure,
        obscuringCharacter: '*',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        onTap: onTap,
        onChanged: onChanged,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
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
            borderRadius: BorderRadius.circular(AppBorderRadius.br8),
            borderSide: BorderSide(
              color: AppColors.kTextFieldColor,
              width: AppWidth.w2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.br8),
            borderSide: BorderSide(
              color: AppColors.kTextFieldColor,
              width: AppWidth.w2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.br8),
            borderSide: BorderSide(
              color: AppColors.kprimaryColor,
              width: AppWidth.w2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.br8),
            borderSide: BorderSide(
              color: AppColors.kannotationPasswordColor,
              width: AppWidth.w2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.br8),
            borderSide: BorderSide(
              color: AppColors.kannotationPasswordColor,
              width: AppWidth.w2,
            ),
          ),
        ),
      ),
    );
  }
}
