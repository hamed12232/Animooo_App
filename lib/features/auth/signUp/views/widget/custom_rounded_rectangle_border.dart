import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_border_radius.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';

class CustomRoundedRectDottedBorder extends StatelessWidget {
  const CustomRoundedRectDottedBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppWidth.w339,
      height: AppHeight.h200,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          strokeWidth: 1,
          radius: Radius.circular(AppBorderRadius.br10),
          color: AppColors.kprimaryColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(CupertinoIcons.photo_fill, color: AppColors.kprimaryColor),
              VerticalSpace(height: AppHeight.h16),
              Text(
                "Select file",
                style: TextStyle(
                  fontSize: AppFontsSize.s16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kprimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
