import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'duration_picker_sheet.dart';

class PlatformDurationPicker {
  static Future<void> show({
    required BuildContext context,
    required Duration initial,
    required void Function(Duration) onConfirm,
  }) async {
    if (Platform.isIOS) {
      Duration temp = initial;

      await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            actions: [
              SizedBox(
                height: 200,
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hms,
                  initialTimerDuration: initial,
                  onTimerDurationChanged: (Duration newDuration) {
                    temp = newDuration;
                  },
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
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return DurationPickerSheet(
            initialHours: initial.inHours,
            initialMinutes: initial.inMinutes.remainder(60),
            initialSeconds: initial.inSeconds.remainder(60),
            onConfirm: onConfirm,
          );
        },
      );
    }
  }
}