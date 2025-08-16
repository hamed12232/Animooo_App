import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAnimooLogoApp extends StatelessWidget {
  const CustomAnimooLogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AssetValues.logoSvg,
          width: AppWidth.w72,
          height: AppHeight.h71,
        ),

        Text(
          "ANIMOOO",
          style: TextStyle(
            fontFamily: FontValues.originalSurfer,
            color: AppColors.kprimaryColor,
            fontSize: AppFontsSize.s11,
          ),
        ),
      ],
    );
  }
}
