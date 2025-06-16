import 'package:flutter_training/features/dashboard/tab_contents/inbox/access_gate/inbox_access_gate.dart';

import 'inbox_packages.dart';

class DashboardInboxScreen extends DashboardBaseTabScreen {
  const DashboardInboxScreen({super.key});

  @override
  AppNavigationBarItem get barItem => AppNavigationBarItem.inbox;

  @override
  Widget buildBody(BuildContext context) {
    return InboxAccessGate(child: _InboxBody());
  }
}

class _InboxBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(inboxMessageViewModelProvider);
    final messagesVM = ref.read(inboxMessageViewModelProvider.notifier);

    return Container(
      color: Colors.grey[300],
      child: PlatformAdaptiveRefreshIndicator(
        onRefresh: messagesVM.refreshMessages,
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return InboxMessageItem(message: messages[index]);
        },
        separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const AppDivider(),
      ),
      ),
    );
  }
}
