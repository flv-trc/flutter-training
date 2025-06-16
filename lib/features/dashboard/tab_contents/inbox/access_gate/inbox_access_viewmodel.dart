import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final inboxAccessViewModelProvider = StateNotifierProvider<InboxAccessViewModel, bool>(
  (ref) => InboxAccessViewModel()..checkAndTrackAccess(),
);

class InboxAccessViewModel extends StateNotifier<bool> {
  InboxAccessViewModel(): super(false);

  static const _counterKey = 'inbox_open_count';

  Future<void> checkAndTrackAccess() async {
    final prefs = await SharedPreferences.getInstance();
    int count = prefs.getInt(_counterKey) ?? 0;
    count += 1;
    await prefs.setInt(_counterKey, count);

    state = !(count % 3 == 1);
  }

  void closePermissionScreen() {
    state = true;
  }
}