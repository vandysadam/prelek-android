import 'package:flutter/material.dart';

class CenterComponent extends StatelessWidget {
  const CenterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.grey[200],
        child: const Text('Center Component'),
      ),
    );
  }
}
