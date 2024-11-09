import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_apps_app/bloc/login_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;

  const PasswordInputWidget({
    Key? key,
    required this.passwordFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (current, previous) => current.password != previous.password,
      builder: (context, state) {
        print('Passworf Build');
        return TextFormField(
          keyboardType: TextInputType.text,
          focusNode: passwordFocusNode,
          obscureText: true,
          decoration: const InputDecoration(
              hintText: 'Password', border: OutlineInputBorder()),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter password';
            }

            if (value.length < 6) {
              return 'Password not less than 6 character';
            }

            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );

    // return TextFormField(
    //   controller: widget.controller,
    //   keyboardType: TextInputType.text,
    //   focusNode: widget.passwordFocusNode,
    //   obscureText: !_isPasswordVisible,
    //   decoration: InputDecoration(
    //     hintText: 'Password',
    //     border: const OutlineInputBorder(),
    //     suffixIcon: IconButton(
    //       icon: Icon(
    //         _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
    //       ),
    //       onPressed: () {
    //         setState(() {
    //           _isPasswordVisible = !_isPasswordVisible;
    //         });
    //       },
    //     ),
    //   ),
    //   validator: (value) {
    //     if (value == null || value.isEmpty) {
    //       return 'Please enter Password';
    //     }
    //     return null;
    //   },
    // );
  }
}
