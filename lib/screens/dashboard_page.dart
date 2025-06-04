import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/app_bottom_navigation_bar.dart';
import 'package:get/get.dart';

import '../routing/router.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedTabIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Workouts")),
      body: Center(child: Text("Workouts Screen")),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedTabIndex: _selectedTabIndex,
        onTabSelected: onTabSelected,
      ),
    );
  }

  void onTabSelected(int index) {
    if (index == _selectedTabIndex) return;
    setState(() {
      _selectedTabIndex = index;
    });

    switch (index) {
      case 0:
        Get.toNamed(AppRouter.feed);
        break;
      case 1:
        Get.toNamed(AppRouter.activity);
        break;
      case 2:
        Get.toNamed(AppRouter.workouts);
        break;
      case 3:
        Get.toNamed(AppRouter.inbox);
        break;
    }
  }
}
