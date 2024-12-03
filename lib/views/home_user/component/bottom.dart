import 'package:flutter/material.dart';
import 'package:mobile_apps_app/config/components/button/logout_button.dart';

class LogoutComponent extends StatelessWidget {
  const LogoutComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Column(
          children: [
            LogoutButton(width: 80, height: 80), // Set button size here
            SizedBox(height: 8),
            Text('Logout', style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }
}
