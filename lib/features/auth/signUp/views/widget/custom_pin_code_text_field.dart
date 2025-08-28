import 'package:animoo_app/core/style/app_border_radius.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({super.key, this.onSubmitted, this.onCompleted});
  final void Function(String value)? onSubmitted;
  final void Function(String value)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 5,
      appContext: context,

      keyboardType: TextInputType.number,
      autoDismissKeyboard: true,
      autoDisposeControllers: true,
      obscureText: false,
      onCompleted: onCompleted,
      onSubmitted: onSubmitted,
      animationType: AnimationType.fade,
      enableActiveFill: true,
      cursorColor: AppColors.kprimaryColor,
      pinTheme: PinTheme(
        selectedColor: AppColors.kprimaryColor,
        selectedFillColor: Colors.transparent,

        shape: PinCodeFieldShape.box,
        activeColor:
            AppColors.kprimaryColor, //لون بولدر الخانة اللي كتبت فيها كود خلاص

        activeFillColor:
            AppColors.kbackGroungColor, //لون  الخانة اللي كتبت فيها كود خلاص
        borderRadius: BorderRadius.circular(AppBorderRadius.br10),
        inactiveColor: AppColors.kborderOtbColor, //لون بولدر الخانة الغير نشطة
        inactiveFillColor: AppColors.kbackGroungColor, //لون  الخانة الغير نشطة

        fieldHeight: AppHeight.h54,
        fieldWidth: AppWidth.w50,
        fieldOuterPadding: const EdgeInsets.symmetric(
          horizontal: PAdding.kPadding10,
        ),
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
    );
  }
}
