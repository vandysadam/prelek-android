import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_apps_app/bloc/login_bloc.dart';
import 'package:mobile_apps_app/config/routes/routes_name.dart';
import 'package:mobile_apps_app/main.dart';
import 'package:mobile_apps_app/views/login/widget/email_input_widget.dart';
import 'package:mobile_apps_app/views/login/widget/housenumber_input_widget.dart';
import 'package:mobile_apps_app/views/login/widget/login_button.dart';
import 'package:mobile_apps_app/views/login/widget/password_input_widget.dart';
import 'package:mobile_apps_app/views/login/widget/user_login_button.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  late LoginBloc _loginBloc;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    debugPrint('UserLoginScreen: initState');
    _loginBloc =
        LoginBloc(loginRepository: getIt(), userLoginRepository: getIt());
    debugPrint('UserLoginScreen: _loginBloc initialized');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('UserLoginScreen: build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HouseNumberInputWidget(emailFocusNode: emailFocusNode),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordInputWidget(
                    passwordFocusNode: passwordFocusNode,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  UserLoginButton(
                    formKey: _formKey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman login user
                      Navigator.pushNamed(context, RoutesName.loginScreen);
                    },
                    child: const Center(
                      child: Text(
                        'Login sebagai Operator',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
