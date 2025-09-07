import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/spacing/horizental_space.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_border_radius.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:animoo_app/core/widget/custom_attribute_text_field.dart';
import 'package:animoo_app/core/widget/custom_rounded_rectangle_border.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  static const String routeName = '/category';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController categoryName = TextEditingController();
  TextEditingController categoryDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroungColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: PAdding.kPadding18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create New Category",
                  style: TextStyle(
                    fontFamily: FontValues.otamaEp,
                    color: AppColors.kprimaryColor,
                    fontSize: AppFontsSize.s20,
                  ),
                ),
              ),
              VerticalSpace(height: AppHeight.h11),
              Row(
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
              ),
              VerticalSpace(height: AppHeight.h20),
              CustomAttributeTextField(
                attribute: "Category Name",
                attributeEditingController: categoryName,
              ),
              VerticalSpace(height: AppHeight.h8),
              CustomAttributeTextField(
                attribute: "Category Description",
                attributeEditingController: categoryDescription,
                maxLines: 3,
              ),
              VerticalSpace(height: AppHeight.h16),
              Padding(
                padding: const EdgeInsets.only(left: PAdding.kPadding18),
                child: Text(
                  "Upload Image For Your Cateogry",
                  style: TextStyle(
                    fontFamily: FontValues.poppins,
                    color: AppColors.kTextFieldHintColor,
                    fontSize: AppFontsSize.s16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              VerticalSpace(height: AppHeight.h8),
              CustomRoundedRectDottedBorder()
            ],
          ),
        ),
      ),
    );
  }
}
