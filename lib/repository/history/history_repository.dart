import 'package:flutter/material.dart';
import 'package:mobile_apps_app/config/app_url.dart';
import 'package:mobile_apps_app/data/network/network_services_api.dart';
import 'package:mobile_apps_app/services/session/session_controller.dart';

abstract class HistoryTransactionRepository {
  Future<List<dynamic>> userHistory();
}

class HistoryTransactionHttpRepository implements HistoryTransactionRepository {
  final NetworkServicesApi networkServicesApi = NetworkServicesApi();

  final SessionController sessionController = SessionController();
  @override
  Future<List<dynamic>> userHistory() async {
    try {
      await sessionController.getUserFromPreference();
      final token = sessionController.accessToken;

      debugPrint('Token yang ada di History: $token');
      if (token == null) {
        debugPrint('Authorization Header: LOGIN KEMBALI');

        throw Exception("Token tidak ditemukan. Harap login kembali.");
      }

      var response = await networkServicesApi.getTokenApi(
        AppUrl.userHistory,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      debugPrint('Authorization Header: Bearer $token');
      debugPrint('Token: $token');
      debugPrint('Endpoint: ${AppUrl.userHistory}');
      debugPrint('Response: $response');

      if (response['statusCode'] == 200) {
        final data = response['data']['data'];
        debugPrint('Data transaksi berhasil diambil: $data');
        debugPrint('Data transaksi berhasil diambil: $data');

        return data; // Pastikan backend mengembalikan data dalam format ini
      } else {
        throw Exception(
            "Gagal mengambil data transaksi. Status: ${response['statusCode']}");
      }
    } catch (error) {
      // Tangani error lain

      throw Exception('Error in payApi: $error');
    }
  }
}
