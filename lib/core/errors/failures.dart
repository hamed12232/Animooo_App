import 'package:animoo_app/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class ServerFailure implements Exception {
  final ErrorModel errorModel;

  ServerFailure(this.errorModel);

}

 void handleDioExceptions(DioException e) {
    final response = e.response;
    final data = response?.data;
    final statusCode = response?.statusCode;

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        if (data != null) {
          throw ServerFailure(ErrorModel.fromJson(data));
        }
        throw ServerFailure(ErrorModel(error: [e.message ?? 'Network error'], code: statusCode ?? 0));
      case DioExceptionType.badResponse:
        if (statusCode != null && data != null) {
          throw ServerFailure(ErrorModel.fromJson(data));
        }
        throw ServerFailure(ErrorModel(error: ['Server error'], code: statusCode ?? 0));
      default:
        if (data != null) {
          throw ServerFailure(ErrorModel.fromJson(data));
        }
        throw ServerFailure(ErrorModel(error: ['Unexpected error'], code: statusCode ?? 0));
    }
  }

 