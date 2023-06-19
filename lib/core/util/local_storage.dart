import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static const _storage = FlutterSecureStorage();

  static late String token;

  static const _keyToken = 'toKen';

  static Future saveToken(String token) async {
    LocalStorage.token = token;
    await _storage.write(key: _keyToken, value: token);
  }

  static Future<String?> loadToken() async {
    LocalStorage.token = await _storage.read(key: _keyToken) ?? "";
    return LocalStorage.token;
  }

  static Future<bool> loadSession() async {
    await loadToken();
    if (LocalStorage.token.isEmpty) {
      return false;
    }
    return true;
  }

  /// Saves the hash and token from a json
  void getData(Map<String, dynamic> body) {
    LocalStorage.token = body['jwt'];
  }

  static Future<void> clearStorage() async {
    await _storage.deleteAll();
  }

  static final LocalStorage _singleton = LocalStorage._internal();

  factory LocalStorage() {
    return _singleton;
  }

  LocalStorage._internal();
}
