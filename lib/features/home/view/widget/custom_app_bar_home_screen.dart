import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/spacing/horizental_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarHomeScreen extends StatelessWidget {
  const CustomAppBarHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetValues.logoSvg,
          width: AppWidth.w72,
          height: AppHeight.h71,
        ),
        HorizentalSpace(width: AppWidth.w24),
        Text(
          "Hello in ANIMOOO",
          style: TextStyle(
            fontFamily: FontValues.originalSurfer,
            color: AppColors.kprimaryColor,
            fontSize: AppFontsSize.s24,
          ),
        ),
      ],
    );
  }
}