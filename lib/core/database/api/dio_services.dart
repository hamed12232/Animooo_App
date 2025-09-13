import 'package:animoo_app/core/database/api/api_constant.dart';
import 'package:animoo_app/core/database/api/api_consumer.dart';
import 'package:animoo_app/core/errors/error_model.dart';
import 'package:animoo_app/core/errors/failures.dart';
import 'package:dio/dio.dart';

class DioServices extends ApiConsumer {
  Dio dio;
  DioServices({required this.dio}) {
    dio.options.baseUrl = ApiConstant.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.sendTimeout = const Duration(seconds: 30);
    
    
  }

  @override
  Future delete({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.delete(
        url,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
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
      handleDioException(e);
    }
  }

  @override
  Future post({
    required String url,
    dynamic body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.post(
        url,
        data: body,
        queryParameters: queryParameters,
      );

      final int status = response.statusCode ?? 0;
      if (status >= 200 && status < 300) {
        //?success
        return response.data;
      } else {
        //?failure
        throw ServerFailure(
          ErrorModel.fromJson(response.data),
          response.data ?? {},
        );
      }
    } catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future put({
    required String url,
    dynamic body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.put(
        url,
        data: body,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
