import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_apps_app/config/bloc/pay_bloc_bloc.dart';
import 'package:mobile_apps_app/services/session/session_controller.dart';
import 'package:mobile_apps_app/views/payment/display_text_field.dart';
import 'package:mobile_apps_app/utils/enums.dart';

class PaymentForm extends StatefulWidget {
  final Map<String, dynamic> data;
  final void Function(String wallet_id, num cashAmount) onSubmit;

  const PaymentForm({
    super.key,
    required this.data,
    required this.onSubmit,
  });

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  late TextEditingController _cashAmountController;
  late TextEditingController _walletIdController;

  @override
  void initState() {
    super.initState();
    _cashAmountController = TextEditingController(
      text: widget.data['cash_amount']?.toString() ?? '',
    );
    _walletIdController = TextEditingController(
      text: widget.data['wallet_id'] ?? '',
    );
  }

  @override
  void dispose() {
    _cashAmountController.dispose();
    _walletIdController.dispose();
    super.dispose();
  }

  Future<bool> isUserAllowedToPay() async {
    final sessionController = SessionController();
    await sessionController.getUserFromPreference();
    return sessionController.isLogin == true &&
        sessionController.userRole == 'OPERATOR' &&
        sessionController.accessToken != null &&
        sessionController.refreshToken != null;
  }

  void _handleSubmit(BuildContext context) async {
    final String wallet_id = _walletIdController.text.trim();
    final num cash_amount =
        num.tryParse(_cashAmountController.text.trim()) ?? -1;

    // Validasi form sebelum pengiriman
    if (wallet_id.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wallet ID tidak boleh kosong')),
      );
      return;
    }

    if (cash_amount < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cash Amount harus lebih dari 0')),
      );
      return;
    }

    print("===============================================");
    print("===============================================");
    print("Wallet ID: $wallet_id");
    print("Cash Amount: $cash_amount");
    print("===============================================");
    print("===============================================");

    if (await isUserAllowedToPay()) {
      print(
          "Mengirimkan event PayApi dengan wallet_id: $wallet_id dan cash_amount: $cash_amount");

      context.read<PaymentBloc>().add(PayApi(
            wallet_id: wallet_id,
            cash_amount: cash_amount.toDouble(),
          ));

      print(
          'ini yang dikirim ke paymentblok.addPayapi : $wallet_id $cash_amount');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pembayaran sedang diproses...')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User tidak memiliki akses untuk melakukan pembayaran'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String name = widget.data['name'] ?? 'N/A';
    final String houseNumber = widget.data['house_number'] ?? 'N/A';

    return BlocListener<PaymentBloc, PaymentState>(
      listenWhen: (previous, current) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.success) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Pembayaran Berhasil"),
              content: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                )
              ],
            ),
          );
        }
        debugPrint('ini yang tampil di hape: ${state.message}');

        if (state.postApiStatus == PostApiStatus.error) {
          // final errorMessage = (state.message is List)
          //     ? (state.message as List).join(', ')
          //     : state.message.toString();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Pembayaran Gagal"),
              content: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                )
              ],
            ),
          );
          debugPrint('ini yang tampil di hape: ${state.message}');
        }

        if (state.postApiStatus == PostApiStatus.loading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Loading...')),
            );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DisplayTextField(label: "Name", initialValue: name),
          const SizedBox(height: 16),
          DisplayTextField(label: "House Number", initialValue: houseNumber),
          const SizedBox(height: 16),
          TextFormField(
            controller: _walletIdController,
            decoration: const InputDecoration(
              labelText: "Wallet ID",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _cashAmountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Cash Amount",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _handleSubmit(context),
                  child: const Text("Submit"),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("Kembali"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
