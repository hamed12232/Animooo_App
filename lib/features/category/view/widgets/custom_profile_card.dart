
import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/spacing/horizental_space.dart';
import 'package:animoo_app/core/style/app_border_radius.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(AssetValues.categoriesPhoto),
        ),
        HorizentalSpace(width: AppWidth.w6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hamed Ahmed",
              style: TextStyle(
                color: AppColors.kblackColor,
                fontSize: AppFontsSize.s12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: AppHeight.h5),
              padding: EdgeInsets.symmetric(
                horizontal: AppHeight.h5,
                vertical: AppHeight.h5,
              ),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColors.kprofileStateColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(
                  AppBorderRadius.br35,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.public,
                    size: 8,
                    color: AppColors.kprofileStateColor,
                  ),
                  Text(
                    "Public",
                    style: TextStyle(
                      color: AppColors.kprofileStateColor,
                      fontSize: AppFontsSize.s10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
