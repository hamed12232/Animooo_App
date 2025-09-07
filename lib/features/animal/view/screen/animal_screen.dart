import 'dart:io';

import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/functions/select_image.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:animoo_app/core/widget/custom_attribute_text_field.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/core/widget/custom_rounded_rectangle_border.dart';
import 'package:animoo_app/features/category/view/widgets/custom_profile_card.dart';
import 'package:flutter/material.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({super.key});
  static const String routeName = '/animal';

  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  TextEditingController categoryName = TextEditingController();
  TextEditingController categoryDescription = TextEditingController();
  File? imageFile;
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
                  "Add New Animal",
                  style: TextStyle(
                    fontFamily: FontValues.otamaEp,
                    color: AppColors.kprimaryColor,
                    fontSize: AppFontsSize.s20,
                  ),
                ),
              ),
              VerticalSpace(height: AppHeight.h11),
              CustomProfileCard(),
              VerticalSpace(height: AppHeight.h20),
              CustomAttributeTextField(
                attribute: "Animal Name",
                attributeEditingController: categoryName,
              ),
              VerticalSpace(height: AppHeight.h8),
              CustomAttributeTextField(
                attribute: "Animal Description",
                attributeEditingController: categoryDescription,
                maxLines: 3,
              ),
              VerticalSpace(height: AppHeight.h16),
              Padding(
                padding: const EdgeInsets.only(left: PAdding.kPadding18),
                child: Text(
                  "Upload Image For Your Animal",
                  style: TextStyle(
                    fontFamily: FontValues.poppins,
                    color: AppColors.kTextFieldHintColor,
                    fontSize: AppFontsSize.s16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              VerticalSpace(height: AppHeight.h8),
              Padding(
                padding: const EdgeInsets.only(left: PAdding.kPadding10),
                child: CustomRoundedRectDottedBorder(
                  imageFile: imageFile,
                  onTap: () async {
                    {
                      try {
                        await selectImage(imageFile);
                        if (mounted) {
                          setState(() {});
                        }
                      } catch (e) {
                        if (mounted) {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error picking image: $e')),
                          );
                        }
                      }
                    }
                  },
                ),
              ),
              VerticalSpace(height: AppHeight.h33),
              Padding(
                padding: const EdgeInsets.only(left: PAdding.kPadding10),
                child: CustomButton(text: "Save", onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
