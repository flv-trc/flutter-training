import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      'assets/image/login_background.jpg',
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

  Widget mainColumn() {
    var image = Image.asset(
      'assets/image/ntc_logo.png',
      color: Colors.white,
      height: 250,
      fit: BoxFit.contain,
    );

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          image,
          Spacer(),
          authButtons(),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget authButtons() {
    return Row(
      children: [
        Expanded(child: joinButton()),
        SizedBox(width: 20),
        Expanded(child: loginButton()),
      ],
    );
  }

  ElevatedButton loginButton() {
    var loginStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      shadowColor: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 16),
      shape: roundedRectangleShape(),
    );

    var text = Text('Log In');

    return ElevatedButton(
      onPressed: () {
        // TODO: Handle Login Button
      },
      style: loginStyle,
      child: text,
    );
  }

  ElevatedButton joinButton() {
    var joinStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      shadowColor: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 16),
      shape: roundedRectangleShape(),
    );

    var text = Text('Join');

    return ElevatedButton(
      onPressed: () {
        // TODO: Handle Join Button
      },
      style: joinStyle,
      child: text,
    );
  }

  RoundedRectangleBorder roundedRectangleShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: BorderSide(color: Colors.white, width: 1),
    );
  }
}
