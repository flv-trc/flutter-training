import 'package:flutter_training/core/network/dio_client.dart';

import 'inbox_packages.dart';

final inboxMessageViewModelProvider =
    StateNotifierProvider<InboxMessageViewModelProvider, List<InboxMessage>>(
      (ref) => InboxMessageViewModelProvider().._loadMessages(),
    );

class InboxMessageViewModelProvider extends StateNotifier<List<InboxMessage>> {
  InboxMessageViewModelProvider() : super([]);

  void _loadMessages() async {
    final response = await DioClient.instance.get('/inbox_messages');
    final data = response.data as List<dynamic>;
    state = data.map((e) => InboxMessage.fromJson(e)).toList();
  }

  Future<void> refreshMessages() async {
    await Future.delayed(const Duration(seconds: 1));
    _loadMessages();
  }

  void removeMessage(InboxMessage message) {
    state = List.from(state)..remove(message);
  }
}