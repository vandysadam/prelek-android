import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_apps_app/repository/history/history_repository.dart';
import 'package:mobile_apps_app/services/session/session_controller.dart';
import 'package:mobile_apps_app/views/history/model/history_model.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryTransactionHttpRepository repository;
  final SessionController sessionController;

  HistoryBloc({required this.repository, required this.sessionController})
      : super(const HistoryState()) {
    on<HistoryFetched>(_onHistoryFetched);
  }

  Future<void> _onHistoryFetched(
      HistoryFetched event, Emitter<HistoryState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == HistoryStatus.initial) {
        // Ambil respon dari API
        final response = await repository.userHistory();

        // Cek apakah ada data di 'response['data']' dan pastikan tipe datanya benar
        final List<HistoryModel> history =
            (response).map((item) => HistoryModel.fromJson(item)).toList();
        debugPrint("isi respon History $history");
        debugPrint("isi respon History response $response");
        // Emit state dengan data yang sudah diproses
        emit(state.copyWith(
          status: HistoryStatus.success,
          posts: history,
          hasReachedMax: false,
        ));
      }
    } catch (error) {
      // Tangani error jika terjadi
      print('Error: $error');
    }
  }
}
