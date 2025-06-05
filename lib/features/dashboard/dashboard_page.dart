import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/app_bottom_navigation_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  AppNavigationBarItem _selectedTab = AppNavigationBarItem.workouts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _selectedTab.body,
        bottomNavigationBar: AppBottomNavigationBar(
          selectedTabIndex: _selectedTab,
          onTabSelected: onTabSelected,
        ),
      );
  }

  void onTabSelected(AppNavigationBarItem barItem) {
    if (barItem == _selectedTab) return;
    setState(() {
      _selectedTab = barItem;
    });
  }
}