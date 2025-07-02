import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/core/router/router.gr.dart';
import 'package:flutter_training/features/find_friends/contacts_notifier.dart';

class ContactsTab extends ConsumerWidget {
  const ContactsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactsAsync = ref.watch(contactsProvider);

    return contactsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
      data: (contacts) {
        if (contacts.isEmpty) {
          return const Center(child: Text('No contacts found.'));
        }

        return ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (_, index) {
            final contact = contacts[index];
            final displayName = contact.displayName ?? 'Unnamed';

            return ListTile(
              title: Text(displayName),
              onTap: () =>
                  context.pushRoute(ContactDetailsRoute(contact: contact)),
            );
          },
        );
      },
    );
  }
}
