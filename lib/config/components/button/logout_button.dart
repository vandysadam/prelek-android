// logout_button.dart
import 'package:flutter/material.dart';
import 'package:mobile_apps_app/config/routes/routes_name.dart';
import 'package:mobile_apps_app/services/strorage/local_strorage.dart';

class LogoutButton extends StatelessWidget {
  final double width;
  final double height;
  const LogoutButton({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          SecureStorage secureStorage = SecureStorage();
          secureStorage.deleteValue('accessToken').then((value) {
            secureStorage.deleteValue('isLogin');
            Navigator.pushNamed(context, RoutesName.userlogin);
          });
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: const Icon(Icons.logout, size: 40),
      ),
    );
  }
}
