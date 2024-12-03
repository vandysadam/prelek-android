import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_apps_app/bloc/login_bloc.dart';
import 'package:mobile_apps_app/config/routes/routes_name.dart';
import 'package:mobile_apps_app/main.dart';
import 'package:mobile_apps_app/views/login/user_login_screen.dart';
import 'package:mobile_apps_app/views/login/widget/email_input_widget.dart';
import 'package:mobile_apps_app/views/login/widget/login_button.dart';
import 'package:mobile_apps_app/views/login/widget/password_input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    debugPrint('LoginScreen: initState');
    _loginBloc =
        LoginBloc(loginRepository: getIt(), userLoginRepository: getIt());
    debugPrint('LoginScreen: _loginBloc initialized');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('LoginScreen: build');
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
                  EmailInputWidget(emailFocusNode: emailFocusNode),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordInputWidget(
                    passwordFocusNode: passwordFocusNode,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LoginButton(
                    formKey: _formKey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
