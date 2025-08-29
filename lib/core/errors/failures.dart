import 'package:animoo_app/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class ServerFailure implements Exception {
  final ErrorModel errorModel;
  final Map<String, dynamic> response;

  ServerFailure(this.errorModel, this.response);
}

void handleDioException(Object e) {
  if (e is DioException) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerFailure(
          ErrorModel(
            code: e.response?.statusCode ?? 408,
            error: ["Connection Timeout"],
          ),
          e.response?.data??{},
        );
      case DioExceptionType.sendTimeout:
        throw ServerFailure(
          ErrorModel(
            code: e.response?.statusCode ?? 408,
            error: ["Send Timeout"],
          ),
          e.response?.data??{},
        );
      case DioExceptionType.receiveTimeout:
        throw ServerFailure(
          ErrorModel(
            code: e.response?.statusCode ?? 408,
            error: ["Receive Timeout"],
          ),
          e.response?.data??{},
        );
      case DioExceptionType.badCertificate:
        throw ServerFailure(
          ErrorModel(
            code: e.response?.statusCode ?? 408,
            error: ["Bad Certificate"],
          ),
          e.response?.data??{},
        );
      case DioExceptionType.badResponse:
        switch (e.response!.statusCode) {
          case 400:
            throw ServerFailure(
              ErrorModel.fromJson(e.response?.data??{}),
              e.response?.data??{},
            );
          case 401:
            throw ServerFailure(
              ErrorModel.fromJson(e.response?.data??{}),
              e.response?.data??{},
            );
          case 403:
            throw ServerFailure(
              ErrorModel.fromJson(e.response?.data??{}),
              e.response?.data??{},
            );
          case 404:
            throw ServerFailure(
              ErrorModel.fromJson(e.response?.data??{}),
              e.response?.data??{},
            );
          case 500:
            throw ServerFailure(
              ErrorModel.fromJson(e.response?.data??{}),
              e.response?.data??{},
            );
        }
      case DioExceptionType.cancel:
        throw ServerFailure(
          ErrorModel(
            code: e.response?.statusCode ?? 408,
            error: ["Request Canceled"],
          ),
          e.response?.data??{},
        );
      case DioExceptionType.connectionError:
        throw ServerFailure(
          ErrorModel(
            code: e.response?.statusCode ?? 408,
            error: ["Connection Error"],
          ),
          e.response?.data??{},
        );
      case DioExceptionType.unknown:
        throw ServerFailure(
          ErrorModel(
            code: e.response?.statusCode ?? 408,
            error: ["Unknown Error"],
          ),
          e.response?.data??{},
        );
    }
  }
}
