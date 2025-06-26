import 'package:flutter/material.dart';
import 'package:flutter_training/resources/images.dart';
import 'package:flutter_training/routing/router.dart';
import 'package:flutter_training/widgets/buttons.dart';
import 'package:get/get.dart';

class RootScreen extends StatefulWidget {
  final bool showLoginOnStart;

  const RootScreen({super.key, this.showLoginOnStart = false});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  bool _loginPresented = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.showLoginOnStart && !_loginPresented) {
      _loginPresented = true;

      Future.microtask(() => Get.toNamed(AppRouter.login));
    }
  }

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(Images.rootBackground, fit: BoxFit.cover);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: image),
          SafeArea(child: Center(child: mainColumn(context))),
        ],
      ),
    );
  }
}

// Mark - Widget helpers for the Root Screen
extension _RootScreenWidgets on _RootScreenState {
  Widget mainColumn(BuildContext context) {
    var image = Image.asset(
      Images.ntcLogo,
      color: Colors.white,
      height: 250,
      fit: BoxFit.contain,
    );

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          image,
          Spacer(),
          authButtons,
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget get authButtons {
    return Row(
      children: [
        Expanded(
          child: primaryButton(
            label: 'Join',
            onPressed: () {
              Get.toNamed(AppRouter.join);
            },
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: secondaryButton(
            label: 'Log in',
            onPressed: () {
              Get.toNamed(AppRouter.login);
            },
          ),
        ),
      ],
    );
  }
}
