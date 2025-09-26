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
import 'package:animoo_app/features/animal/view_model/cubit/create_animal_cubit.dart';
import 'package:animoo_app/features/category/view/widgets/custom_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({super.key});
  static const String routeName = '/animal';

  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CreateAnimalCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.kbackGroungColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: PAdding.kPadding18),

              child: BlocConsumer<CreateAnimalCubit, CreateAnimalState>(
                listener: (context, state) {
                  if (state is CreateAnimalSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Animal created successfully!'),
                      ),
                    );
                  } else if (state is CreateAnimalError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${state.errorMessage}')),
                    );
                  }
                },
                builder: (context, state) {
                  final createAnimalCubit = context.read<CreateAnimalCubit>();
                  final animalName = createAnimalCubit.animalName;
                  final categoryName = createAnimalCubit.categoryName;
                  final animalPrice = createAnimalCubit.animalPrice;
                  final animalDescription = createAnimalCubit.animalDescription;
                  if (state is CreateAnimalLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kprimaryColor,
                      ),
                    );
                  }
                  return Form(
                    key: createAnimalCubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalSpace(height: AppHeight.h16),
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
                        CustomProfileCard(
                          statusText: " Public",
                          // ignore: deprecated_member_use
                          statusColor: AppColors.kprofileStateColor.withOpacity(
                            0.1,
                          ),
                        ),
                        VerticalSpace(height: AppHeight.h20),
                        CustomAttributeTextField(
                          attribute: "Animal Name",
                          attributeEditingController: animalName,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter animal name'
                              : null,
                        ),
                        VerticalSpace(height: AppHeight.h8),
                        CustomAttributeTextField(
                          attribute: "Animal Description",
                          attributeEditingController: animalDescription,
                          maxLines: 3,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter animal description'
                              : null,
                        ),
                        VerticalSpace(height: AppHeight.h16),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: PAdding.kPadding18,
                          ),
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
                          padding: const EdgeInsets.only(
                            left: PAdding.kPadding10,
                          ),
                          child: CustomRoundedRectDottedBorder(
                            imageFile: imageFile,
                            onTap: () async {
                              await selectImage((file) {
                                setState(() {
                                  imageFile = file;
                                });
                              }, context);
                            },
                          ),
                        ),

                        VerticalSpace(height: AppHeight.h16),
                        CustomAttributeTextField(
                          attribute: "Animal Price",
                          attributeEditingController: animalPrice,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter animal price'
                              : null,
                        ),
                        VerticalSpace(height: AppHeight.h16),
                        CustomAttributeTextField(
                          attribute: "Category Name",
                          attributeEditingController: categoryName,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter category name'
                              : null,
                        ),
                        VerticalSpace(height: AppHeight.h33),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: PAdding.kPadding10,
                          ),
                          child: CustomButton(
                            text: "Save",
                            onPressed: () {
                              createAnimalCubit.createAnimal(imageFile!.path);
                            
                            },
                          ),
                        ),
                        VerticalSpace(height: AppHeight.h33),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
