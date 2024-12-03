import 'package:flutter/material.dart';

class DropdownLimit extends StatelessWidget {
  final int selectedLimit;
  final ValueChanged<int> onChanged;

  const DropdownLimit({
    super.key,
    required this.selectedLimit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: selectedLimit,
      items: [5, 10, 20]
          .map((limit) => DropdownMenuItem<int>(
                value: limit,
                child: Text('$limit Transaksi'),
              ))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
      isExpanded: true, // Opsional: agar dropdown memenuhi lebar parent-nya
      underline: const SizedBox(), // Opsional: menghilangkan garis bawah
    );
  }
}
