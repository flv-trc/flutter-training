import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/styledButton.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      'assets/image/join_login_background.jpg',
      fit: BoxFit.cover,
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: image),
          SafeArea(child: Center(child: mainColumn())),
        ],
      ),
    );
  }
}

// Mark - Widget helpers for the Root Screen
extension RootScreenWidgets on RootScreen {
  Widget mainColumn() {
    var image = Image.asset(
      'assets/image/ntc_logo.png',
      color: Colors.white,
      height: 250,
      fit: BoxFit.contain,
    );

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          image,
          Spacer(),
          authButtons(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget authButtons() {
    return Row(
      children: [
        Expanded(
          child: primaryButton(label: 'Join', onPressed: () {}),
        ),
        SizedBox(width: 20),
        Expanded(
          child: secondaryButton(label: 'Log in', onPressed: () {}),
        ),
      ],
    );
  }
  
}
