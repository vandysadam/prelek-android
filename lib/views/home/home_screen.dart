import 'package:flutter/material.dart';
import 'package:mobile_apps_app/config/routes/routes_name.dart';
import 'package:mobile_apps_app/services/strorage/local_strorage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              // SecureStorage secureStrorage = SecureStorage();
              // secureStrorage.deleteValue('accessToken').then((value) {
              //   secureStrorage.deleteValue('accessToken');
              //   Navigator.pushNamed(context, RoutesName.loginScreen);
              // });
              SecureStorage secureStorage = SecureStorage();
              secureStorage.deleteValue('accessToken').then((value) {
                secureStorage.deleteValue('isLogin'); // Hapus juga `isLogin`
                Navigator.pushNamed(context, RoutesName.loginScreen);
              });
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
