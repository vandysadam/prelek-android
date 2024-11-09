import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_apps_app/bloc/login_bloc.dart';
import 'package:mobile_apps_app/utils/validation.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;

  const EmailInputWidget({Key? key, required this.emailFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (current, previous) => current.login_id != previous.login_id,
      builder: (context, state) {
        print('Build');
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          decoration: const InputDecoration(
              hintText: 'Email', border: OutlineInputBorder()),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(login_id: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter email';
            }

            if (!Validation.emailValidator(value)) {
              return 'Please enter valid email';
            }

            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
