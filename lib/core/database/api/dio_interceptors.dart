import 'dart:developer';

import 'package:animoo_app/core/database/api/api_constant.dart';
import 'package:animoo_app/core/database/local/flutter_secure.dart';
import 'package:dio/dio.dart';

class DioInterceptors {
  final Dio dio;
  DioInterceptors(this.dio);
  InterceptorsWrapper get interceptor => 
     InterceptorsWrapper(
      onRequest: (options, handler) async {
        final accessToken = await FlutterSecureDatabase.getSecuredString(
          ApiKeys.accessToken,
        );
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
              log("📤 Sending request with token: Bearer $accessToken");

        }
        return handler.next(options); //continue
      },

      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          final refreshed = await _refreshAccessToken();
          if (refreshed) {
            // 🟡 لو التجديد نجح → عيد الطلب بنفس الـ Access Token الجديد
            final newToken = await FlutterSecureDatabase.getSecuredString(
              ApiKeys.accessToken,
            );
            final requestOptions = e.requestOptions;
            requestOptions.headers["Authorization"] = "Bearer $newToken";

            final response = await dio.fetch(requestOptions);
            return handler.resolve(response);
          }
        }
        return handler.next(e);
      },
    );
  

  Future<bool> _refreshAccessToken() async {
    try {
      final refreshToken = await FlutterSecureDatabase.getSecuredString(
        ApiKeys.refreshToken,
      );
      if (refreshToken == null) return false;

      final response = await dio.post(
        ApiConstant.generateNewAccessToken,
        options: Options(headers: {ApiKeys.refreshToken: refreshToken}),
      );

      final newAccessToken = response.data["access_token"];

      // 📝 خزّن التوكنات الجديدة
      await FlutterSecureDatabase.setSecuredString(
        ApiKeys.accessToken,
        newAccessToken,
      );
      log("✅ Token refreshed successfully $newAccessToken");

      return true;
    } catch (e) {
      log("❌ Refresh failed: $e");
      return false;
    }
  }
}
