import 'package:flutter/material.dart';
import 'picker_column.dart';

class DurationPickerSheet extends StatefulWidget {
  final int initialHours;
  final int initialMinutes;
  final int initialSeconds;
  final void Function(Duration duration) onConfirm;

  const DurationPickerSheet({
    super.key,
    required this.initialHours,
    required this.initialMinutes,
    required this.initialSeconds,
    required this.onConfirm,
  });

  @override
  State<DurationPickerSheet> createState() => _DurationPickerSheetState();
}

class _DurationPickerSheetState extends State<DurationPickerSheet> {
  late int selectedHours;
  late int selectedMinutes;
  late int selectedSeconds;

  @override
  void initState() {
    super.initState();
    selectedHours = widget.initialHours;
    selectedMinutes = widget.initialMinutes;
    selectedSeconds = widget.initialSeconds;
  }

  @override
  Widget build(BuildContext context) {
    final hoursPicker = PickerColumn(
      label: 'HH',
      min: 0,
      max: 23,
      initial: selectedHours,
      onChanged: (v) => selectedHours = v,
    );
    final minutesPicker = PickerColumn(
      label: 'MM',
      min: 0,
      max: 59,
      initial: selectedMinutes,
      onChanged: (v) => selectedMinutes = v,
    );
    final secondsPicker = PickerColumn(
      label: 'SS',
      min: 0,
      max: 59,
      initial: selectedSeconds,
      onChanged: (v) => selectedSeconds = v,
    );

    final header = Row(
      children: [
        const Text(
          'Set Duration',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.check_circle_outline),
          iconSize: 32,
          onPressed: () {
            final duration = Duration(
              hours: selectedHours,
              minutes: selectedMinutes,
              seconds: selectedSeconds,
            );
            widget.onConfirm(duration);
            Navigator.pop(context);
          },
        ),
      ],
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            header,
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: [hoursPicker, minutesPicker, secondsPicker],
            ),
          ],
        ),
      ),
    );
  }
}
