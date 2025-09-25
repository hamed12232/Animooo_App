import 'package:animoo_app/core/database/api/api_constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureDatabase {
  static Future<void> setSecuredString(String key, String value) {
    const storage = FlutterSecureStorage();

    return storage.write(key: key, value: value);
  }

  static Future<String?> getSecuredString(String key) async {
    const storage = FlutterSecureStorage();

    return await storage.read(key: key);
  }

  static Future<void> clearTokens() async {
    const storage = FlutterSecureStorage();

    await storage.delete(key: ApiKeys.accessToken);
    await storage.delete(key: ApiKeys.refreshToken);
  }
}
