import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:animoo_app/core/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomAttributeTextField extends StatelessWidget {
  const CustomAttributeTextField({
    super.key,
    required this.attributeEditingController,
    required this.attribute,
    this.validator, this.maxLines,
  });
  final TextEditingController attributeEditingController;
  final String attribute;
  final String? Function(String? value)? validator;
    final int? maxLines;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: PAdding.kPadding18),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              attribute,
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
          controller: attributeEditingController,
          hintText: "Enter your $attribute",
          isObsecure: false,
          validator: validator,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
