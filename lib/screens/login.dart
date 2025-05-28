import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/primary_textfield.dart';
import 'package:flutter_training/widgets/styledButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: mainVStack(context))),
    );
  }
}

extension LoginScreenWidgets on LoginScreen {
  Widget mainVStack(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          _closeContainer(context),
          _nikeIcon,
          _mainLabel,
          PrimaryTextfield(hintText: 'Email address'),
          PrimaryTextfield(hintText: 'Password', obscureText: true),
          _forgotPasswordButton(() {}),
          _legalDisclaimerRichLabel(onTermsTap: () {}, onPrivacyTap: () {}),
          flatBlackButton(
            label: 'SIGN IN',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          _notAMemberLabel(onJoinTap: () {}),
          Spacer(),
        ],
      ),
    );
  }

  Widget get _nikeIcon => Image.asset('assets/image/nike.png', height: 40);

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

  Widget _legalDisclaimerRichLabel({
    required VoidCallback onTermsTap,
    required VoidCallback onPrivacyTap,
  }) {
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
          TextSpan(
            text: "Privacy Policy",
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTermsTap,
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: "Terms of Use",
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
          ),
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
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black54,
        height: 1.5,
      ),
      children: [
        const TextSpan(text: 'Not a member? '),
        TextSpan(
          text: 'Join us',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()..onTap = onJoinTap,
        ),
      ],
    ),
  );
}
}
