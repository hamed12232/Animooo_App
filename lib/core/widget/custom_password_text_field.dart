import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:animoo_app/core/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    required this.passwordEditingController,
    required this.text,
  });

  final TextEditingController passwordEditingController;
  final String text;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: PAdding.kPadding22),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.text,
              style: TextStyle(
                fontFamily: FontValues.poppins,
                color: AppColors.kTextFieldHintColor,
                fontSize: AppFontsSize.s16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        MyTextFormField(
          controller: widget.passwordEditingController,
          hintText: "*********",
          isObsecure: isObsecure,
          suffixIcon: IconButton(
            icon: Icon(
              isObsecure ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
              color: AppColors.kgreyColor,
            ),
            onPressed: () {
              setState(() {
                isObsecure = !isObsecure;
              });
            },
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Password';
            }
            return null;
          },
        ),
      ],
    );
  }
}
