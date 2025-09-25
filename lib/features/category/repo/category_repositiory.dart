import 'package:animoo_app/core/errors/error_model.dart';
import 'package:animoo_app/features/category/model/category_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepositiory {
  Future<Either<ErrorModel, CategoryModel>> createNewCategory(
    String name,
    String imagePath,
    String description,
  );
  Future<Either<ErrorModel, List<CategoryModel>>> showAllCategories();
}
