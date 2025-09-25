import 'dart:developer';
import 'dart:io';

import 'package:animoo_app/core/style/app_border_radius.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

Future<void> selectImage(
  Function(File) onImagePicked,
  BuildContext context,
) async {
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
              onPressed: () async {
                File? file = await pickImageAtGallery();
                if (file != null) {
                  onImagePicked(file);
                  Navigator.pop(context);
                }
              },
              // ignore: deprecated_member_use
              buttonColor: AppColors.kbackGroungColor.withOpacity(0.8),
              textColor: AppColors.kprimaryColor,
              isButtonImageSelector: true,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppBorderRadius.br10),
                topRight: Radius.circular(AppBorderRadius.br10),
              ),
            ),
          ),
          const Divider(
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
              onPressed: () async {
                File? file = await pickImageAtCamera();
                if (file != null) {
                  onImagePicked(file);
                  Navigator.pop(context);
                }
              },
              // ignore: deprecated_member_use
              buttonColor: AppColors.kbackGroungColor.withOpacity(1),
              textColor: AppColors.kprimaryColor,
              isButtonImageSelector: true,
              borderRadius: const BorderRadius.only(
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

Future<File?> pickImageAtCamera() async {
  try {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image != null ? File(image.path) : null;
  } catch (e) {
    log('Error picking image: $e');
  }
  return null;
}

Future<File?> pickImageAtGallery() async {
  try {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image != null ? File(image.path) : null;
  } catch (e) {
    log('Error picking image: $e');
  }
  return null;
}
