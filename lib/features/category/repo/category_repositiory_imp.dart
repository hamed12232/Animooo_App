import 'dart:developer';

import 'package:animoo_app/core/database/api/api_constant.dart';
import 'package:animoo_app/core/database/api/dio_services.dart';
import 'package:animoo_app/core/errors/error_model.dart';
import 'package:animoo_app/core/errors/failures.dart';
import 'package:animoo_app/features/category/model/category_model.dart';
import 'package:animoo_app/features/category/repo/category_repositiory.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CategoryRepositioryImp extends CategoryRepositiory {
  CategoryRepositioryImp(this._dioServices);
  final DioServices _dioServices;
  @override

  Future<Either<ErrorModel, CategoryModel>> createNewCategory(
    String name,
    String imagePath,
    String description,
  ) async {
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
      });
      final response = await _dioServices.post(
        url: ApiConstant.createNewCategory,
        body: formData,
      );
      log(response.toString());
      return Right(CategoryModel.fromJson(response["Category"]));
    } on ServerFailure catch (e) {
      log(e.errorModel.error.toString());
      return Left(e.errorModel);
    } catch (e) {
      return Left(ErrorModel(error: [e.toString()], code: 500));
    }
  }
  
  @override
  Future<Either<ErrorModel, List<CategoryModel>>> showAllCategories() async{
    try {
      final response = await _dioServices.get(
        url: ApiConstant.showAllCategories,
      );
      List<CategoryModel> categories = (response['Categories'] as List)
          .map((categoryJson) => CategoryModel.fromJson(categoryJson))
          .toList();
      return Right(categories);
    } on ServerFailure catch (e) {
      log(e.errorModel.error.toString());
      return Left(e.errorModel);
    } catch (e) {
      return Left(ErrorModel(error: [e.toString()], code: 500));
    }
  
  }
}
