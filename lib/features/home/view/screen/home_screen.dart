import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/spacing/horizental_space.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_border_radius.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:animoo_app/features/home/view/widget/custom_app_bar_home_screen.dart';
import 'package:animoo_app/features/home/view/widget/custom_list_view_seperator_categories.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroungColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              CustomAppBarHomeScreen(),
              VerticalSpace(height: AppHeight.h20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories ( 10 )",
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
              ),
              VerticalSpace(height: AppHeight.h20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: PAdding.kPadding24,
                  ),

                  child: CustomListViewSeperatorCategories(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
