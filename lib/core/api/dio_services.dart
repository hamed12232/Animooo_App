import 'package:animoo_app/core/api/api_constant.dart';
import 'package:animoo_app/core/api/api_consumer.dart';
import 'package:animoo_app/core/errors/failures.dart';
import 'package:dio/dio.dart';

class DioServices extends ApiConsumer {
  Dio dio;
  DioServices({required this.dio}) {
    dio.options.baseUrl = ApiConstant.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 5);
    dio.options.sendTimeout = const Duration(seconds: 10);
  }
  @override
  Future delete({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.post(url, queryParameters: queryParameters);

      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.get(url, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.post(
        url,
        data: body,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future put({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.post(
        url,
        data: body,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
