import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class HistoryModel extends Equatable {
  final String namaUser;
  final String transaksi;
  final int jumlah;
  final DateTime tanggal;
  final String status;

  const HistoryModel({
    required this.namaUser,
    required this.transaksi,
    required this.jumlah,
    required this.tanggal,
    required this.status,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      namaUser: json['nama_user'] as String,
      transaksi: json['transaksi'] as String,
      jumlah: int.parse(json['jumlah'].toString()),
      tanggal: DateFormat('dd/MM/yyyy').parse(json['tanggal'] as String),
      status: json['status'] as String,
    );
  }

  @override
  List<Object?> get props => [namaUser, transaksi, jumlah, tanggal, status];
}
