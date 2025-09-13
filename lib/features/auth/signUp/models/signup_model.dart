import 'package:equatable/equatable.dart';

class AuthResponse extends Equatable {
  final int? statusCode;
  final String? message;
  final String? alert;
  final UserResponseModel? user;

  const AuthResponse({this.statusCode, this.message, this.alert, this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    alert: json['alert'],
    statusCode: json['statusCode'],
    message: json['message'],
    user: json['user'] != null
        ? UserResponseModel.fromJson(json['user'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'statusCode': statusCode,
    'message': message,
    'alert': alert,
    'user': user?.toJson(),
  };

  @override
  List<Object?> get props => [statusCode, message, alert, user];
}

class UserResponseModel extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String imagePath;
  final String isVerified;

  const UserResponseModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.imagePath,
    required this.isVerified,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        phone: json['phone'],
        imagePath: json['image_path'],
        isVerified: json['is_verified'] ?? "false",
      );
  Map<String, dynamic> toJson() => {
    'id': id,
    'firse_name': firstName,
    'last_name': lastName,
    'email': email,
    'phone': phone,
    'image_path': imagePath,
    'is_verified': isVerified,
  };

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    phone,
    imagePath,
    isVerified,
  ];
}
