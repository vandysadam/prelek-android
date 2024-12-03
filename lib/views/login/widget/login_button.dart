import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_apps_app/bloc/login_bloc.dart';
import 'package:mobile_apps_app/config/routes/routes_name.dart';
import 'package:mobile_apps_app/utils/enums.dart';
import 'package:mobile_apps_app/utils/flush_bar_helper.dart';

class LoginButton extends StatelessWidget {
  final formKey;
  const LoginButton({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (previous, current) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          FlushBarHelper.flushBarErrorMessage(
              state.message.toString(), context);
        }

        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamed(context, RoutesName.homeScreen);
        }

        if (state.postApiStatus == PostApiStatus.loading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text('loading...')),
            );
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate() &&
                  state.password.length >= 6) {
                context.read<LoginBloc>().add(LoginApi());
              }
            },
            child: state.postApiStatus == PostApiStatus.loading
                ? const CircularProgressIndicator()
                : Text('Login'),
          );
        },
      ),
    );
  }
}
