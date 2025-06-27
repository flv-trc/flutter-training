import 'dart:async';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/extensions/app_contact';
import 'contacts_notifier.dart';

final searchFriendsProvider = StateNotifierProvider<SearchFriendsNotifier, AsyncValue<List<Contact>>>(
  (ref) => SearchFriendsNotifier(ref),
);

class SearchFriendsNotifier extends StateNotifier<AsyncValue<List<Contact>>> {
  SearchFriendsNotifier(this._ref) : super(const AsyncData([]));

  final Ref _ref;
  Timer? _debounce;

  void search(String query) {
    _debounce?.cancel();

    if (query.length < 3) {
      state = const AsyncData([]);
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 300), () {
      final contactsAsync = _ref.read(contactsProvider);
      
      if (contactsAsync is! AsyncData<List<Contact>>) {
        state = AsyncError('Contacts not loaded yet', StackTrace.current);
        return;
      }

      final contacts = contactsAsync.value;

      final filteredResults = contacts.where((c) => !c.isBlocked).toList();

      final results = filteredResults.where((contact) {
        final name = contact.displayName ?? '';
        final email = contact.emails?.isNotEmpty == true ? contact.emails!.first.value ?? '' : '';
        return name.toLowerCase().contains(query.toLowerCase()) ||
            email.toLowerCase().contains(query.toLowerCase());
      }).toList();

      state = AsyncData(results);
    });
  }

  void clear() {
    _debounce?.cancel();
    state = const AsyncData([]);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
