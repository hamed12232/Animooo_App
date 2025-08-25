import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:flutter/material.dart';

class CustomPasswordRules extends StatelessWidget {
  const CustomPasswordRules({
    super.key,
    required this.rulesColor,
    required this.rulesText,
  });
  final Color rulesColor;
  final String rulesText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: PAdding.kPadding24),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: rulesColor, size: AppHeight.h8),
          Text(
            rulesText,
            style: TextStyle(
              fontFamily: FontValues.poppins,
              color: rulesColor,
              fontSize: AppFontsSize.s9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
