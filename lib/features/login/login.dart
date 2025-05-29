import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/features/login/login_viewmodel.dart';
import 'package:flutter_training/widgets/textfields.dart';
import 'package:flutter_training/widgets/buttons.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  void onTermsTap() {
    // TODO - On Terms Tap
  }

  void onPrivacyTap() {
    // TODO - On Privacy Tap
  }

  void onForgotPasswordTap() {
    // TODO - On Forgot Password Tap
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();

    return Form(key: _formKey, child: mainVStack(context, vm));
  }

  Widget mainVStack(BuildContext context, LoginViewModel vm) {
    var emailTextField = PrimaryTextfield(
      hintText: 'Email',
      controller: vm.emailController,
      keyboardType: TextInputType.emailAddress,
      validator: vm.validateEmail,
    );

    var passwordTextField = PrimaryTextfield(
      hintText: 'Password',
      controller: vm.passwordController,
      obscureText: true,
      validator: vm.validatePassword,
    );

    var image = Image.asset('assets/image/nike.png', height: 40);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            _closeContainer(context),
            image,
            _mainLabel,
            emailTextField,
            passwordTextField,
            _forgotPasswordButton(onForgotPasswordTap),
            _legalDisclaimerRichLabel(
              onTermsTap: onTermsTap,
              onPrivacyTap: onPrivacyTap,
            ),
            flatBlackButton(label: 'SIGN IN', onPressed: vm.login),
            _notAMemberLabel(onJoinTap: vm.login),
          ],
        ),
      ),
    );
  }
}

extension _LoginScreenStateWidgets on _LoginScreenState {
  Widget _closeContainer(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        closeButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget get _mainLabel => Padding(
    padding: const EdgeInsets.all(20),
    child: Text(
      'YOUR ACCOUNT FOR EVERYTHING NIKE',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: 'Oswald',
        fontWeight: FontWeight.w700,
        fontSize: 26,
        color: Colors.black,
      ),
    ),
  );

  Widget _forgotPasswordButton(VoidCallback onPressed) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(8),
          minimumSize: Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: const Text(
          'Forgotten your password?',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _legalDisclaimerRichLabel({
    required VoidCallback onTermsTap,
    required VoidCallback onPrivacyTap,
  }) {
    var termsOfUse = TextSpan(
      text: "Terms of Use",
      style: const TextStyle(decoration: TextDecoration.underline),
      recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
    );
    var privacyPolicy = TextSpan(
      text: "Privacy Policy",
      style: const TextStyle(decoration: TextDecoration.underline),
      recognizer: TapGestureRecognizer()..onTap = onTermsTap,
    );
    var richText = RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black54,
          height: 1.4,
        ),
        children: [
          const TextSpan(text: "By logging in, you agree to Nike's "),
          privacyPolicy,
          const TextSpan(text: ' and '),
          termsOfUse,
          const TextSpan(text: '.'),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
      child: richText,
    );
  }

  Widget _notAMemberLabel({required VoidCallback onJoinTap}) {
    var joinUs = TextSpan(
      text: 'Join us',
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()..onTap = onJoinTap,
    );

    const textStyle = TextStyle(
      fontSize: 14,
      color: Colors.black54,
      height: 1.5,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: textStyle,
        children: [
          const TextSpan(text: 'Not a member? '),
          joinUs,
        ],
      ),
    );
  }
}