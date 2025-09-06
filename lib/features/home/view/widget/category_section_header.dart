
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:flutter/material.dart';

class CategorySectionHeader extends StatelessWidget {
  const CategorySectionHeader({
    super.key, required this.headerName,
  });
  final String headerName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerName,
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            color: AppColors.kblackColor,
            fontSize: AppFontsSize.s16,
          ),
        ),
    
        Text(
          "Add New Category",
          style: TextStyle(
            fontFamily: "otama_ep",
            fontWeight: FontWeight.bold,
            color: AppColors.kblackColor,
            fontSize: AppFontsSize.s12,
          ),
        ),
      ],
    );
  }
}
