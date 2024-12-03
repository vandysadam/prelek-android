import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_apps_app/config/bloc/pay_bloc_bloc.dart';
import 'package:mobile_apps_app/main.dart';
import 'package:mobile_apps_app/views/payment/payment_form.dart';

class ResultScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  const ResultScreen({super.key, required this.data});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late PaymentBloc _paymentBloc;

  @override
  void initState() {
    super.initState();
    _paymentBloc = PaymentBloc(
      payRepository: getIt(), // Pastikan ini adalah objek repository yang valid
      sessionController: getIt(), // Pastikan sessionController juga disediakan
    );
  }

  void _handleSubmit(String wallet_id, num cash_amount) {
    // Kirim event ke PaymentBloc dengan data yang sesuai
    _paymentBloc.add(
      PayApi(wallet_id: wallet_id, cash_amount: cash_amount.toDouble()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('QR Result'),
      ),
      body: BlocProvider(
        create: (_) => _paymentBloc,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: PaymentForm(
            data: widget.data,
            onSubmit: _handleSubmit,
          ),
        ),
      ),
    );
  }
}
