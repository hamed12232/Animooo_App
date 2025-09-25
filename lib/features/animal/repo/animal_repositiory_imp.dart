import 'dart:developer';

import 'package:animoo_app/core/database/api/api_constant.dart';
import 'package:animoo_app/core/database/api/dio_services.dart';
import 'package:animoo_app/core/errors/error_model.dart';
import 'package:animoo_app/core/errors/failures.dart';
import 'package:animoo_app/features/animal/model/animal_model.dart';
import 'package:animoo_app/features/animal/repo/animal_repositiory.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AnimalRepositioryImp extends AnimalRepositiory {
    final DioServices _dioServices;
  AnimalRepositioryImp(this._dioServices);

  @override
  Future<Either<ErrorModel, AnimalModel>> createNewAnimal(String name, String imagePath, String description, double price, String categoryId) async{
      try {
      final String fileName = imagePath.split('/').isNotEmpty
          ? imagePath.split('/').last
          : (imagePath.split('\\').isNotEmpty
                ? imagePath.split('\\').last
                : 'image.jpg'); // get the file name

      final formData = FormData.fromMap({
        ApiKeys.name: name,
        ApiKeys.description: description,
        ApiKeys.image: await MultipartFile.fromFile(
          imagePath,
          filename: fileName,
        ),
        ApiKeys.price: price,
        ApiKeys.categoryId: categoryId,
      });
      final response = await _dioServices.post(
        url: ApiConstant.createNewAnimal,
        body: formData,
      );
      log(response.toString());
      return Right(AnimalModel.fromJson(response["Category"]));
    } on ServerFailure catch (e) {
      log(e.errorModel.error.toString());
      return Left(e.errorModel);
    } catch (e) {
      return Left(ErrorModel(error: [e.toString()], code: 500));
    }
  }
  
  @override
  Future<Either<ErrorModel, List<AnimalModel>>> showAllAnimals() async {
    try {
      final response = await _dioServices.get(
        url: ApiConstant.showAllAnimals,
      );
      List<AnimalModel> animals = (response['Animals'] as List)
          .map((animalJson) => AnimalModel.fromJson(animalJson))
          .toList();
      return Right(animals);
    } on ServerFailure catch (e) {
      return Left(e.errorModel);
    } catch (e) {
      return Left(ErrorModel(error: [e.toString()], code: 500));
    }
  }
}