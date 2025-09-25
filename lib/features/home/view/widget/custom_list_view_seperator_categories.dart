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
  const CustomListViewSeperatorCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PAdding.kPadding24),
      child: SizedBox(
        height: AppHeight.h93,
        child: Row(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return HorizentalSpace(width: AppWidth.w24);
                },
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, index) {
                  return SizedBox(
                    width: AppWidth.w70,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: AppWidth.w64,
                              height: AppWidth.w64,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    AssetValues.categoriesPhoto,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Dogs",
                              style: TextStyle(
                                fontSize: AppFontsSize.s16,
                                color: AppColors.kblackColor,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Positioned(
                          right: -5,
                          top: -5,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.kprimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "1",
                              style: TextStyle(
                                color: AppColors.kbackGroungColor,
                                fontSize: AppFontsSize.s12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: AppHeight.h16),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                  },
                  borderRadius: BorderRadius.circular(AppBorderRadius.br5),
                  child: Container(
                    width: AppWidth.w50,
                    height: AppHeight.h16,
                    decoration: BoxDecoration(
                      color: AppColors.ksellAllProductsColor,
                      borderRadius: BorderRadius.circular(AppBorderRadius.br5),
                    ),
                    child: Center(
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontFamily: FontValues.poppins,
                          color: AppColors.kbackGroungColor,
                          fontSize: AppFontsSize.s9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
