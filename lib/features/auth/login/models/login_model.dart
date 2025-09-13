import 'package:animoo_app/features/auth/signUp/models/signup_model.dart';
import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final int? statusCode;
  final String? message;
  final String? accessToken;
  final String? refreshToken;
  final UserResponseModel? user;

  const LoginModel({
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
  
  @override
  List<Object?> get props => [statusCode, message, accessToken, refreshToken, user];
  
}
