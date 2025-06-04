import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/core/base/base_page.dart';
import 'package:flutter_training/features/login/login_viewmodel.dart';
import 'package:flutter_training/widgets/password_strength_meter.dart';
import 'package:flutter_training/widgets/textfields.dart';
import 'package:flutter_training/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../resources/fonts.dart';
import '../../resources/images.dart';
import '../../routing/router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with BaseScreenMixin<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: unfocus,
        child: Form(key: _formKey, child: mainVStack(context, vm)),
      ),
    );
  }

  void _goToDashboard() {
    Get.toNamed(AppRouter.dashboard);
  }

  void _onTermsTap() {
    Get.toNamed(AppRouter.googleWebView);
  }

  void _onPrivacyTap() {
    Get.toNamed(AppRouter.googleExternalUrl);
  }

  void _onForgotPasswordTap() {
    showSnackBar("Forgot Password tapped");
  }

  void _onJoinTap() {
    showSnackBar("Join Us tapped");
  }
}

extension _LoginScreenStateWidgets on _LoginScreenState {
  Widget mainVStack(BuildContext context, LoginViewModel vm) {
    var emailTextField = PrimaryTextfield(
      hintText: _Constant.emailAddress,
      controller: vm.emailController,
      validator: vm.validateEmail,
    );

    var passwordTextField = PrimaryTextfield(
      hintText: _Constant.password,
      controller: vm.passwordController,
      obscureText: true,
      validator: vm.validatePassword,
    );

    var image = Image.asset(Images.nike);

    var passwordStrengthMeter = PasswordStrengthMeter(
      score: vm.passwordScore,
      visible: vm.passwordMeterVisible,
    );
    
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
            passwordStrengthMeter,
            _forgotPasswordButton(_onForgotPasswordTap),
            _legalDisclaimerRichLabel(
              onTermsTap: _onTermsTap,
              onPrivacyTap: _onPrivacyTap,
            ),
            flatBlackButton(
              label: _Constant.signIn,
              enabled: vm.isSignInButtonEnabled,
              onPressed: () {
                if (_formKey.currentState?.validate() == true) {
                  vm.login();
                  _goToDashboard();
                } else {
                  vm.markValidationFailed();
                }
              },
            ),
            _notAMemberLabel(onJoinTap: _onJoinTap),
          ],
        ),
      ),
    );
  }

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
      _Constant.title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: Fonts.oswald,
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
          _Constant.forgottenPassword,
          style: TextStyle(
            fontFamily: Fonts.oswald,
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
      text: _Constant.termsOfUse,
      style: const TextStyle(decoration: TextDecoration.underline),
      recognizer: TapGestureRecognizer()..onTap = onTermsTap,
    );
    var privacyPolicy = TextSpan(
      text: _Constant.privacyPolicy,
      style: const TextStyle(decoration: TextDecoration.underline),
      recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
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
          const TextSpan(text: "${_Constant.legalPrefix} "),
          privacyPolicy,
          const TextSpan(text: " ${_Constant.andConjunction} "),
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
      text: _Constant.joinUs,
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
          const TextSpan(text: '${_Constant.notAMember} '),
          joinUs,
        ],
      ),
    );
  }
}

class _Constant {
  // Strings
  static const notAMember = "Not a member?";
  static const joinUs = "Join us";
  static const privacyPolicy = "Privacy Policy";
  static const termsOfUse = "Terms of Use";
  static const title = "YOUR ACCOUNT FOR EVERYTHING NIKE";
  static const forgottenPassword = "Forgotten your password?";
  static const emailAddress = "Email address";
  static const password = "Password";
  static const signIn = "SIGN IN";
  static const legalPrefix = "By logging in, you agree to Nike's";
  static const andConjunction = "and";
}