import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/styledButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: primaryButton(
          label: 'Log In Screen',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
