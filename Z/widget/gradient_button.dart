import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GradientButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // fixedSize: const Size(395, 30),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero, // Menghapus padding default
        ),
        child: const Text(
          'Sign in',
          style: TextStyle(
              // fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color.fromARGB(255, 206, 204, 204)),
        ),
      ),
    );
  }
}
