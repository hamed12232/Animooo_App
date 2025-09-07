
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_border_radius.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppWidth.w339,
      height: AppHeight.h310,
      decoration: BoxDecoration(
        color: AppColors.kTextFieldColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.br8),
      ),
      child: Column(
        children: [
          ListTile(
            dense: true, //عشان يقلل المسافة بين العناصر
            contentPadding: EdgeInsets.only(
              left: PAdding.kPadding8,
              right: PAdding.kPadding14,
            ),
            title: Text(
              "Dog name",
              style: TextStyle(
                color: AppColors.kblackColor,
                fontSize: AppFontsSize.s12,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "create by Hamed Ahmed",
              style: TextStyle(
                color: AppColors.kSubtitleCategoriyTextColor,
                fontSize: AppFontsSize.s12,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              //عشان الـ Row ما يستهلكش المساحة كلها
              children: [
                Text(
                  "1000\$",
                  style: TextStyle(
                    color: AppColors.kprimaryColor,
                    fontSize: AppFontsSize.s12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  CupertinoIcons.ellipsis_vertical,
                  color: AppColors.kellipsisVerticalIconColor,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: AppHeight.h173,
            child: Image.asset(
              'assets/images/png/product1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          VerticalSpace(height: AppHeight.h11),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PAdding.kPadding10,
              ),
              child: Text(
                "I found this sweet dog and am looking for a loving home for them. If you're ready to welcome a new furry friend into your life, this adorable pup is waiting to bring joy and...",
                style: TextStyle(
                  color: AppColors.kblackColor,
                  fontSize: AppFontsSize.s12,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: null,
                overflow: TextOverflow.visible,
                softWrap: true, //عشان الكلام يكسر سطر لو طويل
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
