import 'package:flutter/material.dart';
import 'package:mobile_apps_app/config/components/internet_exception_widget.dart';
import 'package:mobile_apps_app/data/exceptions/exceptions_data.dart';
import 'package:mobile_apps_app/services/splash/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    super.initState();

    _splashServices.isLogin(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw NoInternetException('');
        },
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // RoundButton(
              //   title: 'Login',
              //   onPress: () {
              //     Navigator.pushNamed(context, RoutesName.homeScreen);
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InternetExceptionWidget(
                  onPress: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
