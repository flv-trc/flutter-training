import 'package:flutter/material.dart';

RoundedRectangleBorder rectangleShape({required Color? color, double borderRadius = 30}) =>
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: color != null
          ? BorderSide(color: color, width: 1)
          : BorderSide.none,
    );

enum AppButtonStyle {
  primary,
  secondary,
  inversePrimary,
  inverseSecondary,
  flatBlack,
  flatTransparent;

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

    final double borderRadius = isRounded ? 30 : 0;

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => resolveColor(states, background),
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => resolveColor(states, foreground),
      ),
      shadowColor: WidgetStateProperty.all(Colors.transparent),
      padding: WidgetStateProperty.all(const EdgeInsets.all(16)),
      shape: WidgetStateProperty.all(
        rectangleShape(color: borderColor, borderRadius: borderRadius)
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
      case AppButtonStyle.flatTransparent:
        return buildStyle(
          background: Colors.transparent,
          foreground: Colors.black,
          borderColor: Colors.grey,
          isRounded: false,
        );
    }
  }
}
