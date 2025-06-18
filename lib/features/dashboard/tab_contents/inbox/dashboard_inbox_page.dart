import 'package:flutter_training/features/dashboard/tab_contents/inbox/access_gate/inbox_access_gate.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
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
          final message = messages[index];

          removeMessage() => messagesVM.removeMessage(message);

          return Slidable(
            key: ValueKey(message),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              dismissible: DismissiblePane(onDismissed: removeMessage),
              extentRatio: 0.25,
              children: [
                SlidableAction(
                  autoClose: false,
                  onPressed: (actionContext) {
                    final controller = Slidable.of(actionContext);
                    controller?.dismiss(
                      ResizeRequest(const Duration(milliseconds: 300), () {
                        removeMessage();
                      }),
                      duration: const Duration(milliseconds: 300),
                    );
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                ),
              ],
            ),
            child: InboxMessageItem(message: message),
          );
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const AppDivider(),
        ),
      ),
    );
  }
}
