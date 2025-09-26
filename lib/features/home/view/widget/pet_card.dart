import 'package:animoo_app/core/functions/build_images_from_api.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_border_radius.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:animoo_app/features/animal/model/animal_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  const PetCard({super.key, required this.animalModel});
  final AnimalModel animalModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppWidth.w339,
      height: AppHeight.h310,
      margin: const EdgeInsets.only(bottom: PAdding.kPadding16),
      decoration: BoxDecoration(
        color: AppColors.kTextFieldColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.br8),
      ),
      child: Column(
        children: [
          ListTile(
            dense: true, //عشان يقلل المسافة بين العناصر
            contentPadding: const EdgeInsets.only(
              left: PAdding.kPadding8,
              right: PAdding.kPadding14,
            ),
            title: Text(
              animalModel.animalName,
              style: TextStyle(
                color: AppColors.kblackColor,
                fontSize: AppFontsSize.s12,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "by Hamed",
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
                  "\$${animalModel.animalPrice}",
                  style: TextStyle(
                    color: AppColors.kprimaryColor,
                    fontSize: AppFontsSize.s12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(
                  CupertinoIcons.ellipsis_vertical,
                  color: AppColors.kellipsisVerticalIconColor,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: AppHeight.h173,
            child: CachedNetworkImage(imageUrl: buildFullImageUrl(animalModel.animalImage),
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
                animalModel.animalDescription,
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
