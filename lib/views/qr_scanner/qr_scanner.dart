import 'package:flutter/material.dart';
import 'package:mobile_apps_app/views/result%20qr/result_screen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'dart:convert';

const bgColor = Color(0xfffafafa);

class BarcodeScanScreen extends StatefulWidget {
  const BarcodeScanScreen({super.key});

  @override
  State<BarcodeScanScreen> createState() => _BarcodeScanScreenState();
}

class _BarcodeScanScreenState extends State<BarcodeScanScreen> {
  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('QR Scanner'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Place the QR code in the area",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 10),
                Text("Scanning will start automatically",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: MobileScanner(
              controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.noDuplicates,
              ),
              onDetect: (barcode) {
                final barcodes = barcode.barcodes;
                if (!isScanCompleted && barcodes.isNotEmpty) {
                  setState(() => isScanCompleted = true);
                  String code = barcodes.first.rawValue ?? '---';

                  Map<String, dynamic> qrData = jsonDecode(code);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(data: qrData)),
                  ).then((_) {
                    // Reset kembali isScanCompleted setelah navigasi selesai
                    setState(() => isScanCompleted = false);
                  });
                }
              },
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                "Skripsi 2024",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
