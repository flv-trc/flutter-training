class LoginState {
  final bool isAuthenticating;
  final bool isAuthenticated;
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  final double passwordScore;
  final bool passwordMeterVisible;
  final bool validationFailed;

  bool get isButtonEnabled => !validationFailed;

  const LoginState({
    this.isAuthenticating = false,
    this.isAuthenticated = false,
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.passwordScore = 0,
    this.passwordMeterVisible = false,
    this.validationFailed = false,
  });

  LoginState copyWith({
    bool isAuthenticating = false,
    bool isAuthenticated = false,
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    double? passwordScore,
    bool passwordMeterVisible = false,
    bool validationFailed = false,
  }) {
    return LoginState(
      isAuthenticating: isAuthenticating,
      isAuthenticated: isAuthenticated,
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError,
      passwordError: passwordError,
      passwordScore: passwordScore ?? this.passwordScore,
      passwordMeterVisible: passwordMeterVisible,
      validationFailed: validationFailed,
    );
  }

  static String? validateEmail(String? value) {
    final emailRegex = RegExp(r"^[\w\.-]+@[\w\.-]+\.\w{2,}$");
    if (value == null ||
        value.isEmpty ||
        value.length > 255 ||
        !emailRegex.hasMatch(value)) {
      return "Please enter a valid email address.";
    }
    return null;
  }

  static String? validatePassword(String? value, double score) {
    if (score < 2) {
      return "Please enter a password";
    }
    return null;
  }
}