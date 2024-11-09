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
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(
          //     SnackBar(content: Text(state.message.toString())),
          //   );
        }

        if (state.postApiStatus == PostApiStatus.success) {
          // FlushBarHelper.flushBarSuccessMessage('Login Successfully', context);
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
        buildWhen: (previous, current) =>
            current.postApiStatus != previous.postApiStatus,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginApi());
                if (state.password.length < 6) {
                  print('password not less than 6 character');
                }
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
