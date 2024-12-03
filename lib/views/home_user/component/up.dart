import 'package:flutter/material.dart';

class ProfileComponent extends StatelessWidget {
  final String name;
  final String houseNumber;
  final double balance;

  const ProfileComponent({
    Key? key,
    required this.name,
    required this.houseNumber,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Name: $name'),
          Text('House Number: $houseNumber'),
          Text('Balance: $balance'),
        ],
      ),
    );
  }
}
