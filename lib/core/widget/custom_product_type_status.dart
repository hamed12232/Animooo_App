import 'package:animoo_app/core/style/app_border_radius.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:flutter/material.dart';

class CustomProductTypeStatus extends StatelessWidget {
  const CustomProductTypeStatus({
    super.key,
    required this.statusText,
    required this.statusColor,
    this.color = AppColors.kprofileStateColor,
  });
  final String statusText;
  final Color color;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppHeight.h5),
      padding: EdgeInsets.symmetric(
        horizontal: AppHeight.h5,
        vertical: AppHeight.h5,
      ),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: statusColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.br35),
      ),
      child: Row(
        children: [
          Icon(Icons.public, size: 10, color: color),
          Text(
            statusText,
            style: TextStyle(
              color: color,
              fontSize: AppFontsSize.s10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
