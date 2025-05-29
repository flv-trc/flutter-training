import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.length > 255 ||
        !value.contains('@')) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) return 'Min 6 chars';
    return null;
  }

  void login() {
    // TODO - Perform Login
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
