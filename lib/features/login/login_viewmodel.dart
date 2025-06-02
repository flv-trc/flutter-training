import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _validationFailed = false;

  LoginViewModel() {
    emailController.addListener(_onChanged);
    passwordController.addListener(_onChanged);
  }

  bool get isSignInButtonEnabled =>
      !_validationFailed ||
      (validateEmail(emailController.text) == null &&
          validatePassword(passwordController.text) == null);

  String? validateEmail(String? value) {
    final emailRegex = RegExp(r"^[\w\.-]+@[\w\.-]+\.\w{2,}$");
    
    if (value == null ||
        value.isEmpty ||
        value.length > 255 ||
        !emailRegex.hasMatch(value)) {
      return "Please enter a valid email address.";
    }
    return null;
  }

  String? validatePassword(String? value) {
    return null;
  }

  void _onChanged() {
    if (_validationFailed) {
      _validationFailed = false;
      notifyListeners();
    }
  }

  void markValidationFailed() {
    _validationFailed = true;
    notifyListeners();
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
