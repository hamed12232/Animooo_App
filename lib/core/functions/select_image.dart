import 'dart:developer';
import 'dart:io';

import 'package:animoo_app/core/style/app_border_radius.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

Future<void> selectImage(File? imageFile, BuildContext context) async {
  showBottomSheet(
    context: context,
  
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: double.infinity,
            height: 56.h,
            child: CustomButton(
              text: "Photo Gallery",
              onPressed: () => pickImageAtGallery(imageFile),
              // ignore: deprecated_member_use
              buttonColor: AppColors.kbackGroungColor.withOpacity(0.8),
              textColor: AppColors.kprimaryColor,
              isButtonImageSelector: true,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppBorderRadius.br10),
                topRight: Radius.circular(AppBorderRadius.br10),
              ),
            ),
          ),
          Divider(
            color: AppColors.kgreyColor,
            indent: 0,
            height: 1,
            thickness: 1,
            endIndent: 0,
          ),
          SizedBox(
            width: double.infinity,
            height: 56.h,
            child: CustomButton(
              text: "Camera",
              onPressed: () => pickImageAtCamera(imageFile),
              // ignore: deprecated_member_use
              buttonColor: AppColors.kbackGroungColor.withOpacity(1),
              textColor: AppColors.kprimaryColor,
              isButtonImageSelector: true,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppBorderRadius.br10),
                bottomRight: Radius.circular(AppBorderRadius.br10),
              ),
            ),
          ),
        ],
      );
    },
    backgroundColor: Colors.transparent,
    
  );
}

Future<void> pickImageAtCamera(File? imageFile) async {
  try {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imageFile = File(image.path);
    }
  } catch (e) {
    log('Error picking image: $e');
  }
}

Future<void> pickImageAtGallery(File? imageFile) async {
  try {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
    }
  } catch (e) {
    log('Error picking image: $e');
  }
}
