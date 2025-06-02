import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/buttons.dart';

enum AppButtonStyle {
  primary,
  secondary,
  flatBlack;

  ButtonStyle get style {
    Color resolveColor(Set<WidgetState> states, Color baseColor) {
      if (states.contains(WidgetState.disabled)) {
        return baseColor.withAlpha(128);
      }
      return baseColor;
    }

    switch (this) {
      case AppButtonStyle.primary:
        return ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => resolveColor(states, Colors.white),
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => resolveColor(states, Colors.black),
          ),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 16),
          ),
          shape: WidgetStateProperty.all(roundedRectangleShape()),
        );
      case AppButtonStyle.secondary:
        return ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => resolveColor(states, Colors.transparent),
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => resolveColor(states, Colors.white),
          ),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 16),
          ),
          shape: WidgetStateProperty.all(roundedRectangleShape()),
        );
      case AppButtonStyle.flatBlack:
        return ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => resolveColor(states, Colors.black),
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => resolveColor(states, Colors.white),
          ),
          shadowColor: WidgetStateProperty.all(Colors.black),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 16),
          ),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
        );
    }
  }
}
