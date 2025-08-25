class AuthResponse {
  int? statusCode;
  String? message;
  String? alert;
  UserResponseModel? user;

  AuthResponse({this.statusCode, this.message, this.alert, this.user});

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
}

class UserResponseModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? imagePath;
  String? isVerified;

  UserResponseModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.imagePath,
    this.isVerified,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phone: json['phone'],
        imagePath: json['imagePath'],
        isVerified: json['isVerified'] ?? "false",
      );
  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'phone': phone,
    'imagePath': imagePath,
    'isVerified': isVerified,
  };
}
