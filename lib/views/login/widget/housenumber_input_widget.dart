import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_apps_app/bloc/login_bloc.dart';
import 'package:mobile_apps_app/utils/validation.dart';

class HouseNumberInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;

  const HouseNumberInputWidget({Key? key, required this.emailFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (current, previous) => current.login_id != previous.login_id,
      builder: (context, state) {
        print('Build');
        return TextFormField(
          keyboardType: TextInputType.number,
          focusNode: emailFocusNode,
          decoration: const InputDecoration(
              hintText: 'Nomer Rumah', border: OutlineInputBorder()),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(login_id: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter Nomer rumah';
            }

            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
