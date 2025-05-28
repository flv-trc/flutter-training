import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/styledButton.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: primaryButton(
          label: 'Join Screen',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
