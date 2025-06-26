import 'package:flutter/material.dart';
import 'package:flutter_training/features/find_friends/find_friends_top_tab.dart';
import 'package:permission_handler/permission_handler.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: TabBarView(
        controller: _tabController,
        children: FindFriendsTopTab.values
            .map((tab) => tab.tabBarContent)
            .toList(),
      ),
    );
  }

  AppBar get _appBar {
    return AppBar(
      title: const Text(
        'FIND FRIENDS',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      centerTitle: true,
      leading: const BackButton(),
      actions: const [
        Padding(padding: EdgeInsets.only(right: 12), child: Icon(Icons.search)),
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
