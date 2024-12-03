import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_apps_app/repository/payment/pay_repository.dart';
import 'package:mobile_apps_app/services/session/session_controller.dart'; // pastikan sudah mengimport session controller
import 'package:mobile_apps_app/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pay_bloc_event.dart';
part 'pay_bloc_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PayRepository payRepository;
  final SessionController sessionController;

  // Constructor yang menerima payRepository dan sessionController
  PaymentBloc({
    required this.payRepository,
    required this.sessionController,
  }) : super(const PaymentState()) {
    on<walletidChanged>(_onwalletidChanged);
    on<CashAmountChanged>(_onCashAmountChanged);
    on<PayApi>(_payApi);
  }

  void _onwalletidChanged(walletidChanged event, Emitter<PaymentState> emit) {
    emit(
      state.copyWith(
        wallet_id: event.wallet_id,
      ),
    );
  }

  void _onCashAmountChanged(
      CashAmountChanged event, Emitter<PaymentState> emit) {
    emit(
      state.copyWith(
        cash_amount: event.cash_amount,
      ),
    );
  }

  Future<void> _payApi(PayApi event, Emitter<PaymentState> emit) async {
    // Cek apakah pengguna sudah login dan role-nya 'OPERATOR'
    try {
      debugPrint('Memulai proses pembayaran');
      await sessionController.getUserFromPreference();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');
      debugPrint('Token yang ada di paymentblok: $token');
      final String wallet_id = event.wallet_id;
      final double cash_amount = event.cash_amount;

      if (token == null) {
        emit(
          state.copyWith(
            message: 'Anda tidak memiliki akses untuk melakukan pembayaran',
            postApiStatus: PostApiStatus.error,
          ),
        );
        return; // Menghentikan eksekusi lebih lanjut jika role bukan OPERATOR
      }

      // Jika role OPERATOR, lanjutkan ke pembayaran
      // final paymentData = event.paymentData; // Mendapatkan data dari event
      Map<String, dynamic> data = {
        "wallet_id": wallet_id,
        "cash_amount": cash_amount,
      };
      // }
      debugPrint('ini iiiiiiiiiiiiiiiiiiiiisssssssssssiiiiiiiiii $data');

      emit(
        state.copyWith(postApiStatus: PostApiStatus.loading),
      );
      // Mengirimkan data ke repository untuk diproses
      final result = await payRepository.payApi(
        data,
      );

      if (result.error.isNotEmpty) {
        debugPrint('Response Error: ${result.error}');

        emit(
          state.copyWith(
            message: result.message.toString(),
            postApiStatus: PostApiStatus.error,
          ),
        );
      } else {
        emit(
          state.copyWith(
            message: result.message.toString(),
            postApiStatus: PostApiStatus.success,
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          message: error.toString(),
          postApiStatus: PostApiStatus.error,
        ),
      );
    }
  }
}
