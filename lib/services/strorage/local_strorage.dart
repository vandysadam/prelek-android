import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  Future<void> setValue(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    debugPrint('SecureStorage: Data saved - $key = $value');
    debugPrint('SecureStorage: data dari set value $setValue');
  }

  Future<String?> readValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
    // debugPrint('SecureStorage: Read value for $key = $value');
  }

  Future<bool> deleteValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    debugPrint('SecureStorage: Deleted value for key = $key');
    return true;
  }
}
