import 'package:flutter/foundation.dart';
import 'package:mobile_apps_app/config/app_url.dart';
import 'package:mobile_apps_app/data/network/network_services_api.dart';
import 'package:mobile_apps_app/models/profile/profile_model.dart';
import 'package:mobile_apps_app/services/session/session_controller.dart';

abstract class GetUserByidRepository {
  Future<ProfileModel> getId(String userId);
}

class GetUserHttpApiRepository implements GetUserByidRepository {
  final NetworkServicesApi networkServicesApi = NetworkServicesApi();
  final SessionController sessionController = SessionController();

  @override
  Future<ProfileModel> getId(String userId) async {
    try {
      debugPrint('Starting getApi process..... ');

      await sessionController.getUserFromPreference();
      final token = sessionController.accessToken;
      final sessionUserId = sessionController.user.id;

      debugPrint('Access Token: $token');
      debugPrint('Session User ID: $sessionUserId');
      debugPrint('Function Parameter User ID: $userId');

      if (token == null || token.isEmpty) {
        throw Exception('No access token available');
      }

      if (userId.isEmpty && sessionUserId.isEmpty) {
        throw Exception('User ID is null or empty');
      }

      final effectiveUserId = userId.isNotEmpty ? userId : sessionUserId;

      final url = AppUrl.profileApi(effectiveUserId); // Update URL

      debugPrint('URL yang dibentuk get user by id: $url');

      var response = await networkServicesApi.getApi(url);

      debugPrint('Response dari get user by id repository: $response');

      final statusCode = response['statusCode'];
      debugPrint('Status Code getuser by id: $statusCode');

      if (statusCode == 200) {
        final profileData = response['data']['data'];
        debugPrint('Profile Data: $profileData');
        return ProfileModel.fromJson(profileData);
      } else if (statusCode == 400) {
        return ProfileModel.fromJson(response['data']);
      } else {
        debugPrint('Response Error get user by id: ${response.data}');
        throw Exception(response.data['message'] ?? 'Failed to fetch profile');
      }
    } catch (error) {
      debugPrint('Error get user by id: $error');
      throw Exception('Error in get user by id: $error');
    }
  }
}
