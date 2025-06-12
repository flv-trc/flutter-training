import 'package:flutter/material.dart';
import 'package:flutter_training/core/firebase/authentication_service.dart';
import 'package:zxcvbn/zxcvbn.dart';

class LoginViewModel with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _zxcvbn = Zxcvbn();
  bool _validationFailed = false;
  double passwordScore = 0;
  bool passwordMeterVisible = false;

  LoginViewModel() {
    emailController.addListener(_onChanged);
    passwordController.addListener(_onChangedPassword);
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
    if (passwordScore < 2) {
      return "Please enter a password";
    }
    return null;
  }

  void _onChanged() {
    if (_validationFailed) {
      _validationFailed = false;
    }
    notifyListeners();
  }

  void _onChangedPassword() {
    if (passwordController.text.isNotEmpty) {
      final result = _zxcvbn.evaluate(passwordController.text);
      passwordScore = result.score ?? 0;
      passwordMeterVisible = true;
    } else {
      passwordMeterVisible = false;
    }

    _onChanged();
  }

  void markValidationFailed() {
    _validationFailed = true;
    notifyListeners();
  }

  Future<bool> login() async {
      final credential = await AuthenticationService().login(email: emailController.text.trim(), password: passwordController.text.trim());
      return credential != null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
