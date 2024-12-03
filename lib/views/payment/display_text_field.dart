import 'package:flutter/material.dart';

class DisplayTextField extends StatelessWidget {
  final String label;
  final String initialValue;

  const DisplayTextField({
    super.key,
    required this.label,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
