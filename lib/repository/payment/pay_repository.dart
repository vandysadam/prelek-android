import 'package:flutter/foundation.dart';
import 'package:mobile_apps_app/config/app_url.dart';
import 'package:mobile_apps_app/data/network/network_services_api.dart';
import 'package:mobile_apps_app/models/pay/pay_model.dart';
import 'package:mobile_apps_app/services/session/session_controller.dart';

abstract class PayRepository {
  Future<PayModel> payApi(dynamic data);
}

class PayHttpApiRepository implements PayRepository {
  final NetworkServicesApi networkServicesApi = NetworkServicesApi();
  final SessionController sessionController = SessionController();

  @override
  Future<PayModel> payApi(dynamic data) async {
    try {
      await sessionController.getUserFromPreference();
      final token = sessionController.accessToken;

      if (token == null) {
        throw Exception('No access token available');
      }

      var response =
          await networkServicesApi.postApi(AppUrl.payApi, data, token: token);
      debugPrint('Response dari pay repository aaaaaaaa: $data');
      if (response['statusCode'] == 200) {
        // Parse JSON ke PayModel
        return PayModel.fromJson(response['data']);
        // Sesuaikan dengan struktur JSON Anda
      }
      if (response['statusCode'] == 400) {
        // Parse JSON ke PayModel
        return PayModel.fromJson(response['data']);
        // Sesuaikan dengan struktur JSON Anda
      } else {
        debugPrint('Response Error: nih error ${response.data}');
// Jika ada error, lempar exception
        throw Exception(
          response.data['message'] ?? 'Failed to process payment',
        );
      }
    } catch (error) {
      // Tangani error lain

      throw Exception('Error in payApi: $error');
    }
  }
}
