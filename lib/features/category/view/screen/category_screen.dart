import 'dart:io';

import 'package:animoo_app/core/DI/get_it.dart';
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
import 'package:animoo_app/features/category/view_model/cubit/create_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  static const String routeName = '/category';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CreateCategoryCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.kbackGroungColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: PAdding.kPadding18),

            child: BlocConsumer<CreateCategoryCubit, CreateCategoryState>(
              listener: (context, state) {
                if (state is CreateCategorySuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Category created successfully!'),
                    ),
                  );
                } else if (state is CreateCategoryError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${state.errorMessage}')),
                  );
                }
              },
              builder: (context, state) {
                final createCategoryCubit = context.read<CreateCategoryCubit>();

                if (state is CreateCategoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Form(
                  key: createCategoryCubit.formKey,
                  child: ListView(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpace(height: AppHeight.h16),

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
                      CustomProfileCard(
                        statusText: " Public",
                        statusColor: AppColors.kprofileStateColor.withOpacity(
                          0.1,
                        ),
                      ),
                      VerticalSpace(height: AppHeight.h20),
                      CustomAttributeTextField(
                        attribute: "Category Name",
                        attributeEditingController:
                            createCategoryCubit.nameEditingController,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please enter category name'
                            : null,
                      ),
                      VerticalSpace(height: AppHeight.h8),
                      CustomAttributeTextField(
                        attribute: "Category Description",
                        attributeEditingController:
                            createCategoryCubit.descriptionEditingController,
                        maxLines: 3,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please enter category description'
                            : null,
                      ),
                      VerticalSpace(height: AppHeight.h16),
                      Text(
                        "Upload Image For Your Cateogry",
                        style: TextStyle(
                          fontFamily: FontValues.poppins,
                          color: AppColors.kTextFieldHintColor,
                          fontSize: AppFontsSize.s16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      VerticalSpace(height: AppHeight.h8),
                      CustomRoundedRectDottedBorder(
                        imageFile: imageFile,
                        onTap: () async {
                          await selectImage((file) {
                            setState(() {
                              imageFile = file;
                            });
                          }, context);
                        },
                      ),

                      VerticalSpace(height: AppHeight.h33),
                      CustomButton(
                        text: "Save",
                        onPressed: () async {
                          if (createCategoryCubit.formKey.currentState!
                              .validate()) {
                            await createCategoryCubit.createCategory(
                              imageFile!.path,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
