import 'package:equatable/equatable.dart';

class AnimalModel extends Equatable {
  final int animalId;
  final String animalName;
  final String animalDescription;
  final String animalImage;
  final double animalPrice;
  final int categoryId;
  final int userId;
  final String animalCreatedAt;
  final String animalUpdateAt;

  const AnimalModel({
    required this.animalId,
    required this.animalName,
    required this.animalDescription,
    required this.animalImage,
    required this.animalPrice,
    required this.categoryId,
    required this.userId,
    required this.animalCreatedAt,
    required this.animalUpdateAt,
  });

  factory AnimalModel.fromJson(Map<String, dynamic> json) {
    return AnimalModel(
      animalId: json['animal_id'],
      animalName: json['animal_name'],
      animalDescription: json['animal_description'],
      animalImage: json['animal_image'],
      animalPrice: json['animal_price'],
      categoryId: json['category_id'],
      userId: json['user_id'],
      animalCreatedAt: json['animal_created_at'],
      animalUpdateAt: json['animal_update_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'animal_id': animalId,
      'animal_name': animalName,
      'animal_description': animalDescription,
      'animal_image': animalImage,
      'animal_price': animalPrice,
      'category_id': categoryId,
      'user_id': userId,
      'animal_created_at': animalCreatedAt,
      'animal_update_at': animalUpdateAt,
    };
  }

  @override
  List<Object?> get props => [
    animalId,
    animalName,
    animalDescription,
    animalImage,
    animalPrice,
    categoryId,
    userId,
    animalCreatedAt,
    animalUpdateAt,
  ];
}
