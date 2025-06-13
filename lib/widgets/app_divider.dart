import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double indent;
  final double endIndent;
  final double thickness;
  final Color? color;

  const AppDivider({
    this.indent = 0,
    this.endIndent = 0,
    this.thickness = 0.8,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: thickness,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color ?? Colors.black12,
    );
  }
}