import 'package:animoo_app/core/errors/error_model.dart';
import 'package:animoo_app/features/animal/model/animal_model.dart';
import 'package:dartz/dartz.dart';

abstract class AnimalRepositiory {
  Future<Either<ErrorModel, AnimalModel>> createNewAnimal(
    String name,
    String imagePath,
    String description,
    double price,
    String categoryId
  );

  Future<Either<ErrorModel, List<AnimalModel>>> showAllAnimals();
  Future<int?> getCategoryIdByName(String name);
}