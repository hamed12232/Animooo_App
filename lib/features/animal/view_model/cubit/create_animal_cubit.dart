import 'dart:developer';

import 'package:animoo_app/features/animal/model/animal_model.dart';
import 'package:animoo_app/features/animal/repo/animal_repositiory.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'create_animal_state.dart';

class CreateAnimalCubit extends Cubit<CreateAnimalState> {
  CreateAnimalCubit(this.animalRepositiory) : super(CreateAnimalInitial());
  final AnimalRepositiory animalRepositiory;
  TextEditingController animalName = TextEditingController();
  TextEditingController categoryName = TextEditingController();
  TextEditingController animalPrice = TextEditingController();
  TextEditingController animalDescription = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> createAnimal(String imagePath) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    if (imagePath.isEmpty) {
      emit(
        const CreateAnimalError(errorMessage: "Please select a category image"),
      );
      return;
    }
    if (!(imagePath.isNotEmpty)) {
      // Check if the file exists
      emit(
        const CreateAnimalError(
          errorMessage: "Selected image file not found on device",
        ),
      );
      return;
    }
    emit(CreateAnimalLoading());
    final categoryId = await getCategoryId(categoryName.text);
    if (categoryId == null) {
      emit(const CreateAnimalError(errorMessage: "Category not found"));
      return;
    }

    final result = await animalRepositiory.createNewAnimal(
      animalName.text,
      imagePath,
      animalDescription.text,
      double.parse(animalPrice.text),
      categoryId,
    );
    log(result.toString());
    result.fold(
      (errorModel) =>
          emit(CreateAnimalError(errorMessage: errorModel.error.toString())),
      (categoryModel) => emit(CreateAnimalSuccess(animalModel: categoryModel)),
    );
  }

  Future<int?> getCategoryId(String categoryName) async {
    int? id = await animalRepositiory.getCategoryIdByName(categoryName);
    return id;
  }
}
