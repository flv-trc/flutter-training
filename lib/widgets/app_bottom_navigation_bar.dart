import 'package:flutter/material.dart';

import '../features/dashboard/tab_contents/exports.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final AppNavigationBarItem selectedTabIndex;
  final ValueChanged<AppNavigationBarItem> onTabSelected;

  const AppBottomNavigationBar({
    super.key,
    required this.selectedTabIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: selectedTabIndex.tabIndex,
      onTap: (index) => onTabSelected(AppNavigationBarItem.values[index]),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: AppNavigationBarItem.values
          .map((item) => item.bottomNavigationBarItem)
          .toList(),
      type: BottomNavigationBarType.fixed,
    );
  }
}

enum AppNavigationBarItem {
  feed(tabIndex: 0, icon: Icon(Icons.feed), label: 'Feed'),
  activity(tabIndex: 1, icon: Icon(Icons.bar_chart_sharp), label: 'Activity'),
  workouts(tabIndex: 2, icon: Icon(Icons.timer), label: 'Workouts'),
  inbox(tabIndex: 3, icon: Icon(Icons.mail), label: 'Inbox');

  final int tabIndex;
  final Icon icon;
  final String label;

  const AppNavigationBarItem({
    required this.tabIndex,
    required this.icon,
    required this.label,
  });

  BottomNavigationBarItem get bottomNavigationBarItem {
    return BottomNavigationBarItem(icon: icon, label: label);
  }

  Widget get body {
    switch (this) {
      case AppNavigationBarItem.feed:
        return DashboardFeedScreen();
      case AppNavigationBarItem.activity:
        return DashboardActivityScreen();
      case AppNavigationBarItem.workouts:
        return DashboardWorkoutsScreen();
      case AppNavigationBarItem.inbox:
        return DashboardInboxScreen();
    }
  }
}
