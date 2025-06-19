import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimePickerSheet extends StatefulWidget {
  final DateTime initialDateTime;
  final void Function(DateTime) onConfirm;

  const DateTimePickerSheet({
    super.key,
    required this.initialDateTime,
    required this.onConfirm,
  });

  @override
  State<DateTimePickerSheet> createState() => _DateTimePickerSheetState();
}

class _DateTimePickerSheetState extends State<DateTimePickerSheet> {
  late DateTime tempDate;

  @override
  void initState() {
    super.initState();
    tempDate = widget.initialDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text('Select Date & Time', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.check_circle_outline),
                  iconSize: 32,
                  tooltip: 'Confirm',
                  onPressed: () {
                    widget.onConfirm(tempDate);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                initialDateTime: widget.initialDateTime,
                use24hFormat: true,
                onDateTimeChanged: (DateTime value) {
                  tempDate = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
