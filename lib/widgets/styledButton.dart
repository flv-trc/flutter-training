import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/app_button_style.dart';

RoundedRectangleBorder roundedRectangleShape() => RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
    side: BorderSide(color: Colors.white, width: 1),
  );

ElevatedButton _styledButton({
  required String label,
  required ButtonStyle style,
  required VoidCallback onPressed,
}) {
  var text = Text(label);

  return ElevatedButton(onPressed: onPressed, style: style, child: text);
}

ElevatedButton primaryButton({
  required String label,
  required VoidCallback onPressed,
}) {
  return _styledButton(
    label: label,
    style: AppButtonStyle.primary.style,
    onPressed: onPressed,
  );
}

ElevatedButton secondaryButton({
  required String label,
  required VoidCallback onPressed,
}) {
  return _styledButton(
    label: label,
    style: AppButtonStyle.secondary.style,
    onPressed: onPressed,
  );
}
