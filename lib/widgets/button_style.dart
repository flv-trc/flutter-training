import 'package:flutter/material.dart';

RoundedRectangleBorder roundedRectangleShape({required Color? color}) =>
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: color != null
          ? BorderSide(color: color ?? Colors.white, width: 1)
          : BorderSide.none,
    );

enum AppButtonStyle {
  primary,
  secondary,
  inversePrimary,
  inverseSecondary,
  flatBlack;

  ButtonStyle buildStyle({
    required Color background,
    required Color foreground,
    bool isRounded = true,
    Color? borderColor,
  }) {
    Color resolveColor(Set<WidgetState> states, Color baseColor) {
      return states.contains(WidgetState.disabled)
          ? baseColor.withAlpha(128)
          : baseColor;
    }

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => resolveColor(states, background),
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => resolveColor(states, foreground),
      ),
      shadowColor: WidgetStateProperty.all(Colors.transparent),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 16),
      ),
      shape: WidgetStateProperty.all(
        isRounded
            ? roundedRectangleShape(color: borderColor)
            : const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
    );
  }

  ButtonStyle get style {
    switch (this) {
      case AppButtonStyle.primary:
        return buildStyle(background: Colors.white, foreground: Colors.black);
      case AppButtonStyle.inversePrimary:
        return buildStyle(background: Colors.black, foreground: Colors.white);
      case AppButtonStyle.secondary:
        return buildStyle(
          background: Colors.transparent,
          foreground: Colors.white,
          borderColor: Colors.white,
        );
      case AppButtonStyle.inverseSecondary:
        return buildStyle(
          background: Colors.transparent,
          foreground: Colors.black,
          borderColor: Colors.black,
        );
      case AppButtonStyle.flatBlack:
        return buildStyle(
          background: Colors.black,
          foreground: Colors.white,
          isRounded: false,
        );
    }
  }
}
