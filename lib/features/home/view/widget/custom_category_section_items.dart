import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/features/home/view/widget/category_section_header.dart';
import 'package:animoo_app/features/home/view/widget/custom_list_view_seperator_categories.dart';
import 'package:flutter/material.dart';

class CustomCategorySectionItems extends StatelessWidget {
  const CustomCategorySectionItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategorySectionHeader(
          headerName: "Categories ( 10 )",
          productType: "Category",
        ),
        VerticalSpace(height: AppHeight.h20),
        CustomListViewSeperatorCategories(),
      ],
    );
  }
}
