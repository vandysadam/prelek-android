import 'package:flutter/foundation.dart';
import 'package:mobile_apps_app/config/app_url.dart';
import 'package:mobile_apps_app/data/network/network_services_api.dart';
import 'package:mobile_apps_app/models/user/user_model.dart';

abstract class UserLoginRepository {
  Future<UserModel> userLogin(dynamic data);
}

class UserLoginRepositoryImpl implements UserLoginRepository {
  final NetworkServicesApi networkServicesApi = NetworkServicesApi();

  @override
  Future<UserModel> userLogin(dynamic data) async {
    debugPrint('LoginRepositoryImpl: Starting login API request');

    try {
      // Melakukan request POST
      var response =
          await networkServicesApi.postApi(AppUrl.userloginApi, data);
      debugPrint('LoginRepositoryImpl: Raw API Response - $response');

      // Validasi apakah respons sesuai format yang diharapkan
      if (response is Map<String, dynamic>) {
        // Periksa statusCode dalam respons
        if (response['statusCode'] == 200) {
          var responseData = response['data'];

          // Debugging: Periksa data yang diterima
          debugPrint('LoginRepositoryImpl: Response data - $responseData');

          if (responseData != null &&
              responseData.containsKey('data') &&
              responseData['data'] != null &&
              responseData['data'].containsKey('user') &&
              responseData['data'].containsKey('accessToken') &&
              responseData['data'].containsKey('refreshToken')) {
            // Parsing data pengguna
            var userData = responseData['data']['user'];
            var accessToken = responseData['data']['accessToken'];
            var refreshToken = responseData['data']['refreshToken'];

            return UserModel(
              id: userData['id'],
              name: userData['name'],
              roles: userData['roles'],
              house_number: userData['house_number'],
              accessToken: accessToken,
              refreshToken: refreshToken,
            );
          } else {
            debugPrint(
                'UserLoginRepositoryImpl: Missing required keys in response');
            throw Exception('Invalid response structure');
          }
        } else {
          debugPrint(
              'UserLoginRepositoryImpl: Login failed with status code ${response['statusCode']}');
          throw Exception(response['message'] ?? 'Login failed');
        }
      } else {
        debugPrint(
            'UserLoginRepositoryImpl: Response is not in expected format');
        throw Exception('Response is not in expected format');
      }
    } catch (e) {
      debugPrint(
          'UserLoginRepositoryImpl: Error during login API request - $e');
      throw Exception('An error occurred during login');
    }
  }
}
