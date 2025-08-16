import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:flutter/material.dart';

class CustomTitleAndSubTitleVerficiation extends StatelessWidget {
  const CustomTitleAndSubTitleVerficiation({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: PAdding.kPadding18),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                fontFamily: FontValues.otamaEp,
                color: AppColors.kprimaryColor,
                fontSize: AppFontsSize.s20,
              ),
            ),
          ),
        ),
        VerticalSpace(height: AppFontsSize.s10),
        Padding(
          padding: const EdgeInsets.only(left: PAdding.kPadding18),
          child: RichText(
            text: TextSpan(
              text: subtitle,
              style: TextStyle(
                fontFamily: FontValues.poppins,
                color: AppColors.kTextFieldHintColor,
                fontSize: AppFontsSize.s14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
