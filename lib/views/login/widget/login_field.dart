import 'package:flutter/material.dart';
// import '../pallete.dart';

class LoginField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const LoginField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText:
            widget.hintText.toLowerCase() == 'password' && !_isPasswordVisible,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(17),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                // color: Pallete.borderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                // color: Pallete.borderHere,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: widget.hintText,
            suffixIcon: widget.hintText.toLowerCase() == 'password'
                ? IconButton(
                    icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 17,
                        color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                : null),
      ),
    );
  }
}
