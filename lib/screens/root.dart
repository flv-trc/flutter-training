import 'package:flutter/material.dart';
import 'package:flutter_training/resources/images.dart';
import 'package:flutter_training/routing/router.dart';
import 'package:flutter_training/widgets/buttons.dart';
import 'package:get/get.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

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
extension RootScreenWidgets on RootScreen {
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
