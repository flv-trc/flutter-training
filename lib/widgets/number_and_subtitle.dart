import 'package:flutter/material.dart';

import '../resources/fonts.dart';

class NumberAndSubtitle extends StatelessWidget {
  final int number;
  final double numberFontSize;
  final String subtitle;

  const NumberAndSubtitle({
    super.key,
    required this.number,
    required this.numberFontSize,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Text(
          '$number',
          style: TextStyle(
            fontFamily: Fonts.oswald,
            fontSize: numberFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(subtitle, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}