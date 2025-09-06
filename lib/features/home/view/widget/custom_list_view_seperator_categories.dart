
import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/spacing/horizental_space.dart';
import 'package:animoo_app/core/style/app_border_radius.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:flutter/material.dart';

class CustomListViewSeperatorCategories extends StatelessWidget {
  const CustomListViewSeperatorCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return HorizentalSpace(width: AppWidth.w24);
            },
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, index) {
              return Stack(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: AppBorderRadius.br35,
                        backgroundImage: AssetImage(
                          AssetValues.categoriesPhoto,
                        ),
                      ),
                      Text(
                        "Dogs",
                        style: TextStyle(
                          fontSize: AppFontsSize.s16,
                          color: AppColors.kblackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: AppBorderRadius.br10,
                      backgroundColor: AppColors.kprimaryColor,
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: AppColors.kbackGroungColor,
                          fontSize: AppFontsSize.s12,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
              margin: EdgeInsets.only(top: PAdding.kPadding35),
            width: AppWidth.w50,
            height: AppHeight.h16,
            decoration: BoxDecoration(
              color: AppColors.ksellAllProductsColor,
    
              borderRadius: BorderRadius.circular(
                AppBorderRadius.br5,
              ),
            ),
            child: Center(
              child: Text(
                "See All",
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: AppColors.kbackGroungColor,
                  fontSize: AppFontsSize.s9,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


