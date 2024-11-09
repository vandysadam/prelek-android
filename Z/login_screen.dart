import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';
import 'pallete.dart';
import 'widget/gradient_button.dart';
import 'widget/login_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();


class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Center(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/prelek-logo.png',
                    // width: 190,
                    // height: 190,
                  ),

                  // const Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     'Sign in.',
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 20,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 50),
                  // const SocialButton(
                  //     iconPath: 'assets/svgs/g_logo.svg',
                  //     label: 'Continue with Google'),
                  // const SizedBox(height: 20),
                  // const SocialButton(
                  //   iconPath: 'assets/svgs/f_logo.svg',
                  //   label: 'Continue with Facebook',
                  //   horizontalPadding: 90,
                  // ),
                  // const Text(
                  //   'or',
                  //   style: TextStyle(
                  //     fontSize: 17,
                  //   ),
                  // ),
                  const SizedBox(height: 15),
                  LoginField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  LoginField(
                    hintText: 'Password',
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),

                  GradientButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLoginRequested(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
