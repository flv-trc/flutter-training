import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/core/router/router.gr.dart';
import 'package:flutter_training/features/find_friends/find_friends_top_tab.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class FindFriendsPage extends StatefulWidget {
  const FindFriendsPage({super.key});

  @override
  State<FindFriendsPage> createState() => _FindFriendsPageState();
}

class _FindFriendsPageState extends State<FindFriendsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() async {
    if (_tabController.indexIsChanging) return;
    final selectedTab = FindFriendsTopTab.values[_tabController.index];

    if (selectedTab == FindFriendsTopTab.contacts) {
      final status = await Permission.contacts.status;

      if (status.isGranted) return;

      final result = await Permission.contacts.request();

      if (!result.isGranted) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Contacts permission is required to see your contacts.',
            ),
          ),
        );
      }
    }
  }

  void _onSearchTap(BuildContext context) =>
      context.pushRoute(SearchFriendsRoute());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: TabBarView(
        controller: _tabController,
        children: FindFriendsTopTab.values
            .map((tab) => tab.tabBarContent)
            .toList(),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'FIND FRIENDS',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      centerTitle: true,
      leading: const BackButton(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(onTap: () => _onSearchTap(context), child: const Icon(Icons.search)),
        ),
      ],
      bottom: TabBar(
        controller: _tabController,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.black,
        tabs: FindFriendsTopTab.values
            .map((tab) => Tab(text: tab.title))
            .toList(),
      ),
    );
  }
}
