import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/button_style.dart';

RoundedRectangleBorder roundedRectangleShape() => RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(30),
  side: BorderSide(color: Colors.white, width: 1),
);

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

ElevatedButton flatBlackButton({
  required String label,
  required VoidCallback onPressed,
}) {
  var childLabel = Text(
    label,
    style: TextStyle(
      fontFamily: "Oswald"
    )
  );
  return ElevatedButton(
     style: AppButtonStyle.flatBlack.style,
    onPressed: onPressed,
    child: childLabel,
  );
}

IconButton closeButton({
  required VoidCallback onPressed,
}) {
  return IconButton(
    icon: const Icon(Icons.close),
    iconSize: 28,
    color: Colors.black,
    padding: EdgeInsets.zero,
    constraints: const BoxConstraints(),
    onPressed: onPressed,
  );
}