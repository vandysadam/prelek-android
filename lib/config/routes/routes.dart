import 'package:flutter/material.dart';
import 'package:mobile_apps_app/views/history/page_user_history.dart';
import 'package:mobile_apps_app/views/home_user/user_screen.dart';
import 'package:mobile_apps_app/views/login/user_login_screen.dart';
import 'package:mobile_apps_app/views/qr_scanner/qr_scanner.dart';
import 'package:mobile_apps_app/views/result%20qr/result_screen.dart';
import 'package:mobile_apps_app/views/views.dart';

import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case RoutesName.userlogin:
        return MaterialPageRoute(builder: (context) => const UserLoginScreen());

      case RoutesName.userScreen:
        return MaterialPageRoute(builder: (context) => UserScreen());

      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case RoutesName.resultScreen:
        return MaterialPageRoute(
            builder: (context) => const ResultScreen(
                  data: {},
                ));

      case RoutesName.barcodeScanScreen:
        return MaterialPageRoute(
            builder: (context) => const BarcodeScanScreen());

      case RoutesName.historyScreen:
        return MaterialPageRoute(builder: (context) => HistoryScreen());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('404'),
            ),
          );
        });
    }
  }
}
