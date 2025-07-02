import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_training/extensions/app_contact';
import 'package:flutter_training/widgets/buttons.dart';

@RoutePage()
class ContactDetailsPage extends StatelessWidget {
  final Contact contact;

  const ContactDetailsPage({super.key, required this.contact});

  String get initials {
    final name = contact.displayName ?? '';
    final parts = name.trim().split(' ');
    if (parts.length == 1) return parts.first.characters.first.toUpperCase();
    return parts.take(2).map((e) => e.characters.first.toUpperCase()).join();
  }

  void _onActionButtonPressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Block', style: TextStyle(color: Colors.red)),
              onTap: () {
                contact.block();
                context.router.pop();
                context.router.pop();
              },
            ),
            const Divider(height: 1),
            ListTile(
              title: const Text('Cancel'),
              onTap: () => context.router.pop(),
            ),
          ],
        ),
      ),
    );
  }

  void _onAddFriendButtonPressed() {}

  @override
  Widget build(BuildContext context) {
    final displayName = contact.displayName ?? 'Unknown';

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.lightBlue),
        actions: [
          IconButton(
            onPressed: () => _onActionButtonPressed(context),
            color: Colors.lightBlue,
            icon: const Icon(Icons.more_horiz),
          ),
        ],
        backgroundColor: Colors.grey.shade300,
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            _initialsAvatar,
            const SizedBox(height: 16),
            Text(
              displayName.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 24),
            _addFriendButton,
          ],
        ),
      ),
    );
  }
}

extension _ContactDetailsPageWidgets on ContactDetailsPage {
  SizedBox get _addFriendButton {
    return SizedBox(
      width: 200,
      child: flatTransparentButton(
        label: 'Add Friend',
        onPressed: _onAddFriendButtonPressed,
      ),
    );
  }

  CircleAvatar get _initialsAvatar {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.grey.shade300,
      child: Text(
        initials,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.black,
        ),
      ),
    );
  }
}
