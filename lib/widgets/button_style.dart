import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/buttons.dart';

enum AppButtonStyle {
  primary,
  secondary,
  flatBlack;

  ButtonStyle get style {
    switch (this) {
      case AppButtonStyle.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: roundedRectangleShape(),
        );
      case AppButtonStyle.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: roundedRectangleShape(),
        );
      case AppButtonStyle.flatBlack:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        );
    }
  }
}
