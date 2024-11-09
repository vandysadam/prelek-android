import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobile_apps_app/models/user/user_model.dart';
import 'package:mobile_apps_app/services/strorage/local_strorage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();

  final SecureStorage localStorage = SecureStorage();
  UserModel user = const UserModel();
  bool? isLogin;

  SessionController._internal() {
    isLogin = false;
  }

  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInPreference(UserModel user) async {
    localStorage.setValue('accessToken', jsonEncode(user.toJson()));

    localStorage.setValue('isLogin', 'true');
  }

  // Future<void> getUserFromPreference() async {
  //   try {
  //     var userData = await localStrorage.readValue('accessToken');
  //     var isLogin = await localStrorage.readValue('isLogin');

  //     if (userData.isNotEmpty) {
  //       SessionController().user = UserModel.fromJson(jsonDecode(userData));
  //     }
  //     SessionController().isLogin = isLogin == true ? true : false;
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await localStorage.readValue('accessToken');
      var loginStatus = await localStorage.readValue('isLogin');

      if (userData != null && userData.isNotEmpty) {
        user = UserModel.fromJson(jsonDecode(userData));
      }
      isLogin = loginStatus == 'true';
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
  }
}
