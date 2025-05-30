import 'package:flutter/material.dart';

enum PasswordStrength {
  tooWeak('TOO WEAK', Colors.grey),
  poor('POOR', Colors.red),
  fair('FAIR', Colors.orange),
  good('GOOD', Colors.blue),
  excellent('EXCELLENT', Colors.green);

  final String label;
  final Color color;

  const PasswordStrength(this.label, this.color);

  static PasswordStrength fromScore(double score) {
    switch (score) {
      case 0:
        return PasswordStrength.tooWeak;
      case 1:
        return PasswordStrength.poor;
      case 2:
        return PasswordStrength.fair;
      case 3:
        return PasswordStrength.good;
      case 4:
      default:
        return PasswordStrength.excellent;
    }
  }
}

class PasswordStrengthMeter extends StatelessWidget {
  final double score;
  final bool visible;

  const PasswordStrengthMeter({
    super.key,
    required this.score,
    this.visible = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!visible) return const SizedBox.shrink();

    final strength = PasswordStrength.fromScore(score);

    var metricBar = LayoutBuilder(
      builder: (context, constraints) {
        final filledWidth = constraints.maxWidth * ((score + 1) / 5);
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: filledWidth,
            height: 8,
            decoration: BoxDecoration(
              color: strength.color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      },
    );
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Password strength: ',
          style: TextStyle(color: Colors.grey.shade700),
        ),
        SizedBox(
          width: 90,
          child: Text(
            strength.label,
            style: TextStyle(
              color: strength.color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: metricBar),
      ],
    );
  }
}
