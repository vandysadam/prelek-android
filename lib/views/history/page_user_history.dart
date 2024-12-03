import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_apps_app/repository/history/history_repository.dart';
import 'package:mobile_apps_app/services/session/session_controller.dart';
import 'package:mobile_apps_app/views/history/bloc/history_bloc.dart';
import 'package:mobile_apps_app/views/history/component/date_range_picker.dart';
import 'package:mobile_apps_app/views/history/component/dropdown_tanggal.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final SessionController sessionController = SessionController();
  int selectedLimit = 5;
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: BlocProvider(
        create: (context) => HistoryBloc(
          repository: HistoryTransactionHttpRepository(),
          sessionController: sessionController,
        )..add(HistoryFetched()),
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            if (state.status == HistoryStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == HistoryStatus.success) {
              debugPrint('ini state posts: ${state.posts}');
              List filteredPosts = state.posts
                  .where((history) {
                    if (startDate != null && endDate != null) {
                      debugPrint('Checking date: ${history.tanggal}');
                      debugPrint('Start Date: $startDate, End Date: $endDate');

                      return history.tanggal.isAfter(
                              startDate!.subtract(const Duration(days: 1))) &&
                          history.tanggal
                              .isBefore(endDate!.add(const Duration(days: 1)));
                    }
                    return true;
                  })
                  .take(selectedLimit)
                  .toList();

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Dropdown untuk memilih jumlah transaksi
                    DropdownLimit(
                      selectedLimit: selectedLimit,
                      onChanged: (value) {
                        setState(() {
                          selectedLimit = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Date Range Picker untuk memilih rentang tanggal
                    DateRangePicker(
                      startDateController: startDateController,
                      endDateController: endDateController,
                      onStartDateChanged: (date) {
                        setState(() {
                          startDate = date;
                        });
                      },
                      onEndDateChanged: (date) {
                        setState(() {
                          endDate = date;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // List transaksi
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredPosts.length,
                        itemBuilder: (context, index) {
                          final history = filteredPosts[index];
                          return HistoryCard(
                            namaUser: history.namaUser,
                            transaksi: history.transaksi,
                            jumlah: history.jumlah,
                            tanggal: history.tanggal,
                            status: history.status,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state.status == HistoryStatus.failure) {
              return const Center(child: Text('Failed to load history.'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String namaUser;
  final String transaksi;
  final int jumlah;
  final DateTime tanggal;
  final String status;

  const HistoryCard({
    super.key,
    required this.namaUser,
    required this.transaksi,
    required this.jumlah,
    required this.tanggal,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User: $namaUser',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('Transaction: $transaksi'),
            const SizedBox(height: 4),
            Text(
              'Amount: ${NumberFormat.currency(locale: 'id', symbol: 'Rp ').format(jumlah)}',
            ),
            const SizedBox(height: 4),
            Text('Date: ${DateFormat('dd/MM/yyyy').format(tanggal)}'),
            const SizedBox(height: 4),
            Text(
              'Status: $status',
              style: TextStyle(
                color: status == 'SUCCESS' ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
