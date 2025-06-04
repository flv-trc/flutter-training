import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int selectedTabIndex;
  final ValueChanged<int> onTabSelected;

  const AppBottomNavigationBar({
    super.key,
    required this.selectedTabIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedTabIndex,
      onTap: onTabSelected,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: const [
        AppNavigationBarItem.feed,
        AppNavigationBarItem.activity,
        AppNavigationBarItem.workouts,
        AppNavigationBarItem.inbox,
      ].map((item) => item.bottomNavigationBarItem).toList(),
      type: BottomNavigationBarType.fixed,
    );
  }
}

enum AppNavigationBarItem {
  feed(icon: Icon(Icons.feed), label: 'Feed'),
  activity(icon: Icon(Icons.bar_chart_sharp), label: 'Activity'),
  workouts(icon: Icon(Icons.timer), label: 'Workouts'),
  inbox(icon: Icon(Icons.mail), label: 'Inbox');

  final Icon icon;
  final String label;

  const AppNavigationBarItem({required this.icon, required this.label});

  BottomNavigationBarItem get bottomNavigationBarItem {
    return BottomNavigationBarItem(icon: icon, label: label);
  }
}