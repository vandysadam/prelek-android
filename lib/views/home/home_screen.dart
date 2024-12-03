// home_screen.dart
import 'package:flutter/material.dart';
import 'package:mobile_apps_app/config/components/button/logout_button.dart';
import 'package:mobile_apps_app/config/components/button/scan_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: const Column(
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    LogoutButton(width: 80, height: 80), // Set button size here
                    SizedBox(height: 8),
                    Text('Logout', style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(width: 50),
                Column(
                  children: [
                    ScanButton(width: 80, height: 80),
                    SizedBox(height: 8),
                    Text('Scan Barcode', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
