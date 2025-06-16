import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/button_style.dart';

ElevatedButton primaryButton({
  required String label,
  required VoidCallback onPressed,
}) {
  var childLabel = Text(label);
  return ElevatedButton(
    style: AppButtonStyle.primary.style,
    onPressed: onPressed,
    child: childLabel,
  );
}

ElevatedButton secondaryButton({
  required String label,
  required VoidCallback onPressed,
}) {
  var childLabel = Text(label);
  return ElevatedButton(
    style: AppButtonStyle.secondary.style,
    onPressed: onPressed,
    child: childLabel,
  );
}

ElevatedButton inversePrimaryButton({
  required String label,
  required VoidCallback onPressed,
}) {
  var childLabel = Text(label);
  return ElevatedButton(
    style: AppButtonStyle.inversePrimary.style,
    onPressed: onPressed,
    child: childLabel,
  );
}

ElevatedButton inverseSecondaryButton({
  required String label,
  required VoidCallback onPressed,
}) {
  var childLabel = Text(label);
  return ElevatedButton(
    style: AppButtonStyle.inverseSecondary.style,
    onPressed: onPressed,
    child: childLabel,
  );
}

ElevatedButton flatBlackButton({
  required String label,
  required VoidCallback onPressed,
  bool enabled = true,
}) {
  var childLabel = Text(label, style: TextStyle(fontFamily: "Oswald"));
  return ElevatedButton(
    style: AppButtonStyle.flatBlack.style,
    onPressed: enabled ? onPressed : null,
    child: childLabel,
  );
}

IconButton closeButton({required VoidCallback onPressed}) {
  return IconButton(
    icon: const Icon(Icons.close),
    iconSize: 28,
    color: Colors.black,
    padding: EdgeInsets.zero,
    constraints: const BoxConstraints(),
    onPressed: onPressed,
  );
}
