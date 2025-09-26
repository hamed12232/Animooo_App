import 'dart:io';

import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_border_radius.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRoundedRectDottedBorder extends StatefulWidget {
  const CustomRoundedRectDottedBorder({super.key, this.onTap, this.imageFile});
  final void Function()? onTap;
  final File? imageFile;

  @override
  State<CustomRoundedRectDottedBorder> createState() =>
      _CustomRoundedRectDottedBorderState();
}

class _CustomRoundedRectDottedBorderState
    extends State<CustomRoundedRectDottedBorder> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        children: [
          SizedBox(
            width: AppWidth.w339,
            height: AppHeight.h200,
            child: DottedBorder(
              options: const RoundedRectDottedBorderOptions(
                strokeWidth: 1,
                radius: Radius.circular(AppBorderRadius.br10),
                color: AppColors.kprimaryColor,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.photo_fill,
                      color: AppColors.kprimaryColor,
                    ),
                    VerticalSpace(height: AppHeight.h16),
                    Text(
                      "Select file",
                      style: TextStyle(
                        fontSize: AppFontsSize.s16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kprimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (widget.imageFile != null)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppBorderRadius.br10),
                child: Image.file(
                  widget.imageFile!,
                  key: ValueKey(widget.imageFile?.path),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: $error');
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 24,
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
