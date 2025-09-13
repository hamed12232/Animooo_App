import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureDatabase {

  static setSecuredString(String key, String value) {
    final storage = FlutterSecureStorage();
    return storage.write(key: key, value: value);

  }
  static getSecuredString(String key) async {
    final storage = FlutterSecureStorage();
    return await storage.read(key: key) ?? "";
  }
}