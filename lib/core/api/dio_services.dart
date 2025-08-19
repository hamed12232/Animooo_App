import 'package:animoo_app/core/api/api_constant.dart';
import 'package:animoo_app/core/api/api_consumer.dart';
import 'package:animoo_app/core/errors/failures.dart';
import 'package:dio/dio.dart';

class DioServices extends ApiConsumer {
  Dio dio;
  DioServices(this.dio) {
    dio.options.baseUrl = ApiConstant.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 5);
    dio.options.sendTimeout = const Duration(seconds: 10);
  }
  @override
  Future delete({required String url, Map<String, dynamic>? queryParameters}) {
    throw UnimplementedError();
  }

  @override
  Future get({required String url, Map<String, dynamic>? queryParameters}) {
    throw UnimplementedError();
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
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      } else {
        throw ServerFailure(response.statusMessage!);
      }
    } catch (e) {
      if (e is DioException) {
        return ServerFailure.fromDioError(e);
      }
      return ServerFailure(e.toString());
    }
  }

  @override
  Future put({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) {
    throw UnimplementedError();
  }
}
