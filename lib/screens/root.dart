import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/core/router/router.gr.dart';
import 'package:flutter_training/resources/images.dart';
import 'package:flutter_training/widgets/buttons.dart';

@RoutePage()
class RootScreen extends StatefulWidget {
  final bool showLoginOnStart;

  const RootScreen({super.key, this.showLoginOnStart = false});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  bool _loginPresented = false;

  @override
  Widget build(BuildContext context) {
    if (widget.showLoginOnStart && !_loginPresented) {
      _loginPresented = true;

      final router = AutoRouter.of(context);
      Future.microtask(() => router.push(LoginRoute()));
    }
    
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
            onPressed: () => context.pushRoute(JoinRoute()),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: secondaryButton(
            label: 'Log in',
            onPressed: () => context.pushRoute(LoginRoute()),
          ),
        ),
      ],
    );
  }
}
