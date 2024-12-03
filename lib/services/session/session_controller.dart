import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_apps_app/models/user/user_model.dart';
import 'package:mobile_apps_app/services/strorage/local_strorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();

  final SecureStorage localStorage = SecureStorage();
  UserModel user = const UserModel();
  bool? isLogin;
  String? userRole;
  String? accessToken;
  String? refreshToken;
  String? id;

  SessionController._internal() {
    isLogin = false;
    debugPrint('SessionController: initialized with isLogin = $isLogin');
  }

  factory SessionController() {
    return _session;
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  // Simpan data user, token, dan status login
  Future<void> saveUserInPreference(
      UserModel userModel, String accessToken, String refreshToken) async {
    debugPrint('SessionController: saveUserInPreference ${userModel.toJson()}');

    if (userModel.accessToken.isEmpty || userModel.roles.isEmpty) {
      debugPrint('SessionController: invalid accessToken or roles');
      return;
    }

    // Simpan user data
    localStorage.setValue('user', jsonEncode(userModel.toJson()));
    localStorage.setValue('accessToken', accessToken);
    localStorage.setValue('refreshToken', refreshToken);
    localStorage.setValue('isLogin', 'true');
    localStorage.setValue('userRole', userModel.roles);
    localStorage.setValue('userId', userModel.id);

    debugPrint('SessionController: User, accessToken, and refreshToken saved');
  }

  // Ambil data user dan token dari storage
  Future<void> getUserFromPreference() async {
    debugPrint('SessionController: getUserFromPreference called');
    try {
      var userData = await localStorage.readValue('user');
      var loginStatus = await localStorage.readValue('isLogin');
      userRole = await localStorage.readValue('userRole');
      accessToken = await localStorage.readValue('accessToken');
      refreshToken = await localStorage.readValue('refreshToken');
      id = await localStorage.readValue('userId');

      debugPrint('SessionController: userRole loaded - $userRole');
      debugPrint('SessionController: accessToken loaded - $accessToken');
      debugPrint('SessionController: refreshToken loaded - $refreshToken');

      if (userData != null && userData.isNotEmpty) {
        user = UserModel.fromJson(jsonDecode(userData));
        debugPrint('SessionController: user data loaded - ${user.toJson()}');
      }
      isLogin = loginStatus == 'true';
      debugPrint('SessionController: isLogin status - $isLogin');
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
  }
}
