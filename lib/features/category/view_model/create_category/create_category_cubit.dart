import 'package:animoo_app/features/category/model/category_model.dart';
import 'package:animoo_app/features/category/repo/category_repositiory.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'create_category_state.dart';

class CreateCategoryCubit extends Cubit<CreateCategoryState> {
  CreateCategoryCubit(this.categoryRepositiory)
    : super(CreateCategoryInitial());
  final CategoryRepositiory categoryRepositiory;
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> createCategory(String imagePath) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    if (imagePath.isEmpty) {
      emit(const CreateCategoryError("Please select a category image"));
      return;
    }
    if (!(imagePath.isNotEmpty)) {
      // Check if the file exists
      emit(
        const CreateCategoryError("Selected image file not found on device"),
      );
      return;
    }
    emit(CreateCategoryLoading());

    final result = await categoryRepositiory.createNewCategory(
      nameEditingController.text,
      imagePath,
      descriptionEditingController.text,
    );
    result.fold(
      (errorModel) => emit(CreateCategoryError(errorModel.error.toString())),
      (categoryModel) => emit(CreateCategorySuccess(categoryModel)),
    );
  }
}
