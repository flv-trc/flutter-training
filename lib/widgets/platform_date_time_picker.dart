import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformDateTimePicker {
  static Future<void> show({
    required BuildContext context,
    required DateTime initial,
    required void Function(DateTime) onConfirm,
  }) async {
    if (Platform.isIOS) {
      DateTime temp = initial;

      await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            actions: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: initial,
                  mode: CupertinoDatePickerMode.dateAndTime,
                  use24hFormat: true,
                  onDateTimeChanged: (value) => temp = value,
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Done'),
              onPressed: () {
                onConfirm(temp);
                Navigator.pop(context);
              },
            ),
          );
        },
      );
    } else {
      final now = DateTime.now();

      final pickedDate = await showDatePicker(
        context: context,
        initialDate: initial,
        firstDate: DateTime(now.year - 5),
        lastDate: DateTime(now.year + 5),
      );

      if (!context.mounted || pickedDate == null) return;

      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initial),
      );

      if (!context.mounted || pickedTime == null) return;

      final fullDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      onConfirm(fullDateTime);
    }
  }
}
