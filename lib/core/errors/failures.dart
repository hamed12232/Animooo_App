import 'package:animoo_app/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class ServerFailure implements Exception {
  final ErrorModel errorModel;

  ServerFailure(this.errorModel);

}

 void handleDioExceptions(Object e) {
  if (e is DioException) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerFailure(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.sendTimeout:
        throw ServerFailure(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.receiveTimeout:
        throw ServerFailure(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.badResponse:
        switch (e.response!.statusCode) {
          case 400:
            throw ServerFailure(ErrorModel.fromJson(e.response!.data));
          case 401:
            throw ServerFailure(ErrorModel.fromJson(e.response!.data));
          case 403:
            throw ServerFailure(ErrorModel.fromJson(e.response!.data));
          case 404:
            throw ServerFailure(ErrorModel.fromJson(e.response!.data));
          case 500:
            throw ServerFailure(ErrorModel.fromJson(e.response!.data));
        }
      case DioExceptionType.cancel:
        throw ServerFailure(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.unknown:
        throw ServerFailure(ErrorModel.fromJson(e.response!.data));
      default:
        throw ServerFailure(ErrorModel.fromJson(e.response!.data));
    }
       
  }

 }