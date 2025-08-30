import 'package:animoo_app/features/auth/signUp/models/signup_model.dart';

class LoginModel {
  int? statusCode;
  String? message;
  String? accessToken;
  String? refreshToken;
  UserResponseModel? user;

  LoginModel({
    this.statusCode,
    this.message,
    this.accessToken,
    this.refreshToken,
    this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      statusCode: json['statusCode']??0,
      message: json['message'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      user: json['user'] != null
          ? UserResponseModel.fromJson(json['user'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'user': user?.toJson(),
    
    };
  }
  
}
