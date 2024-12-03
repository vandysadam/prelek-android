import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangePicker extends StatelessWidget {
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final ValueChanged<DateTime?> onStartDateChanged;
  final ValueChanged<DateTime?> onEndDateChanged;

  const DateRangePicker({
    Key? key,
    required this.startDateController,
    required this.endDateController,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
  }) : super(key: key);

  Future<void> _pickDate(BuildContext context, TextEditingController controller,
      ValueChanged<DateTime?> onDateChanged) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      onDateChanged(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: startDateController,
            readOnly: true,
            decoration: const InputDecoration(labelText: 'Dari Tanggal'),
            onTap: () =>
                _pickDate(context, startDateController, onStartDateChanged),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            controller: endDateController,
            readOnly: true,
            decoration: const InputDecoration(labelText: 'Sampai Tanggal'),
            onTap: () =>
                _pickDate(context, endDateController, onEndDateChanged),
          ),
        ),
      ],
    );
  }
}
