import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String? value) {
    return null;
  }

  String? validatePassword(String? value) {
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
