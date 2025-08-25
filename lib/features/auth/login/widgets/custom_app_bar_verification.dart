
import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBarVerification extends StatelessWidget {
  const CustomAppBarVerification({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            CupertinoIcons.back,
            color: AppColors.kprimaryColor,
            size: AppFontsSize.s30,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColors.kprimaryColor,
            fontSize: AppFontsSize.s20,
            fontWeight: FontWeight.w400,
            fontFamily: FontValues.otamaEp,
          ),
        ),
      ],
    );
  }
}
