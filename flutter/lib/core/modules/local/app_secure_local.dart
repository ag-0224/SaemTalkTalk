import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AppSecureLocal {
  AppSecureLocal._();

  /// SecureStorage 키 값들
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userEmailKey = 'user_email';

  /// SecureStorage 인스턴스 (Android Keystore / iOS Keychain 사용)
  static final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// 토큰 저장
  static Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  static Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  static Future<void> saveUserEmail(String email) async {
    await _storage.write(key: _userEmailKey, value: email);
  }

  /// 토큰 불러오기
  static Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  static Future<String?> getUserEmail() async {
    return await _storage.read(key: _userEmailKey);
  }

  /// 전체 삭제
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  /// 특정 키만 삭제
  static Future<void> deleteAccessToken() async {
    await _storage.delete(key: _accessTokenKey);
  }

  static Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _refreshTokenKey);
  }

  static Future<void> deleteUserEmail() async {
    await _storage.delete(key: _userEmailKey);
  }
}
