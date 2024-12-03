// settings_button.dart
import 'package:flutter/material.dart';
import 'package:mobile_apps_app/config/routes/routes_name.dart';

class ScanButton extends StatelessWidget {
  final double width;
  final double height;

  const ScanButton({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.barcodeScanScreen);

          // Action for the settings button
          print('Settings button pressed');
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: const Icon(Icons.qr_code_scanner, size: 40),
      ),
    );
  }
}
