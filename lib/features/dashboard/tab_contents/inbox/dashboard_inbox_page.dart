import 'inbox_packages.dart';

class DashboardInboxScreen extends DashboardBaseTabScreen {
  const DashboardInboxScreen({super.key});

  @override
  AppNavigationBarItem get barItem => AppNavigationBarItem.inbox;

  @override
  Widget buildBody(BuildContext context) {
    return _InboxBody();
  }
}


class _InboxBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(dashboardInboxViewModelProvider);
    final notifier = ref.read(dashboardInboxViewModelProvider.notifier);

    final listView = ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            return InboxMessageItem(message: messages[index]);
          },
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const AppDivider(),
          )
        );

    return Container(
      color: Colors.grey[300],
      child: RefreshIndicator(
        onRefresh: notifier.refreshMessages,
        child: listView
      )
    );
  }
}
