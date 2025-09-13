import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String imagePath;
  final String createdAt;
  final String updatedAt;
  final int userId;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imagePath: json['imagePath'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imagePath': imagePath,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'userId': userId,
    };
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    imagePath,
    createdAt,
    updatedAt,
    userId,
  ];
}
