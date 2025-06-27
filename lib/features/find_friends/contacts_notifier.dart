import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

final contactsProvider = StateNotifierProvider<ContactsNotifier, AsyncValue<List<Contact>>>(
  (ref) => ContactsNotifier()..loadContacts(),
);

class ContactsNotifier extends StateNotifier<AsyncValue<List<Contact>>> {
  ContactsNotifier() : super(const AsyncLoading());

  Future<void> loadContacts() async {
    final status = await Permission.contacts.request();

    if (!status.isGranted) {
      state = AsyncError('Contacts permission not granted', StackTrace.current);
      return;
    }

    try {
      final contacts = await ContactsService.getContacts(
        withThumbnails: false,
        iOSLocalizedLabels: false,
      );
      state = AsyncData(contacts.toList());
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}