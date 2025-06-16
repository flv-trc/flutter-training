import 'package:flutter/material.dart';

import '../../../../../widgets/buttons.dart';

class InboxPermissionScreen extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onAllow;
  final VoidCallback onDeny;

  const InboxPermissionScreen({
    super.key,
    required this.onClose,
    required this.onAllow,
    required this.onDeny,
  });

  get _closeButton => Positioned(
    top: 16,
    right: 16,
    child: GestureDetector(
      onTap: onClose,
      child: const CircleAvatar(
        radius: 16,
        backgroundColor: Colors.black,
        child: Icon(Icons.close, color: Colors.white, size: 18),
      ),
    ),
  );

  get _mainContent {
    final inboxIcon = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black12),
      ),
      padding: const EdgeInsets.all(20),
      child: const Icon(Icons.inbox, size: 40),
    );

    final mainText = const Text(
      "Don't Miss Out",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );

    final secondaryText = const Text(
      "Get notified about things like friend requests, Nike product offers, and your weekly recaps.",
      style: TextStyle(fontSize: 14, color: Colors.grey),
      textAlign: TextAlign.center,
    );

    final allowButton = SizedBox(
      width: double.infinity,
      child: inversePrimaryButton(
        label: "Allow Notifications",
        onPressed: onAllow,
      ),
    );

    final denyButton = SizedBox(
      width: double.infinity,
      child: inverseSecondaryButton(label: "Not Now", onPressed: onDeny),
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inboxIcon,
            SizedBox(height: 24),
            mainText,
            SizedBox(height: 12),
            secondaryText,
            SizedBox(height: 40),
            allowButton,
            SizedBox(height: 12),
            denyButton,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Stack(children: [_closeButton, _mainContent])),
    );
  }
}
