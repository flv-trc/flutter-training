import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zxcvbn/zxcvbn.dart';

import '../../core/firebase/authentication_service.dart';
import 'login_events.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _zxcvbn = Zxcvbn();

  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginValidationFailed>(_onValidationFailed);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final passwordIsNotEmpty = event.password.isNotEmpty;
    final double passwordScore = passwordIsNotEmpty
        ? _zxcvbn.evaluate(event.password).score?.toDouble() ?? 0.0
        : 0.0;
    emit(
      state.copyWith(
        password: event.password,
        passwordScore: passwordScore,
        passwordMeterVisible: passwordIsNotEmpty,
      ),
    );
  }

  (bool isValid, String? emailError, String? passwordError) _validateAll() {
    final emailErr = LoginState.validateEmail(state.email);
    final passErr = LoginState.validatePassword(
      state.password,
      state.passwordScore,
    );
    return (emailErr == null && passErr == null, emailErr, passErr);
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    final (isValid, emailError, passwordError) = _validateAll();

    if (!isValid) {
      emit(
        state.copyWith(
          validationFailed: true,
          emailError: emailError,
          passwordError: passwordError,
        ),
      );
      return;
    }

    emit(state.copyWith(isAuthenticating: true));

    await AuthenticationService().login(
      email: state.email.trim(),
      password: state.password.trim(),
    );

    emit(state.copyWith(isAuthenticating: false, isAuthenticated: true));
  }

  void _onValidationFailed(
    LoginValidationFailed event,
    Emitter<LoginState> emit,
  ) {
    final (_, emailError, passwordError) = _validateAll();

    emit(state.copyWith(emailError: emailError, passwordError: passwordError));
  }
}