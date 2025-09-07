import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/spacing/horizental_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:animoo_app/core/widget/custom_product_type_status.dart';
import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({
    super.key,
    required this.statusText,
    required this.statusColor,
  });
  final String statusText;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(backgroundImage: AssetImage(AssetValues.categoriesPhoto)),
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
            CustomProductTypeStatus(
              statusText: statusText,
              statusColor: statusColor,
            ),
          ],
        ),
      ],
    );
  }
}
