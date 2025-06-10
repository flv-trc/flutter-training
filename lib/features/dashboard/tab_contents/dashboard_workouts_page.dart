import 'package:flutter/material.dart';
import 'package:flutter_training/mock/mock_workouts.dart';
import 'package:get/get.dart';

import '../../../core/base/dashboard_base_tab_page.dart';
import '../../../routing/router.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
import '../dashboard_workouts/dashboard_top_tab.dart';

class DashboardWorkoutsScreen extends DashboardBaseTabScreen {
  const DashboardWorkoutsScreen({super.key});

  @override
  AppNavigationBarItem get barItem => AppNavigationBarItem.workouts;

  @override
  Widget? get trailingItem => IconButton(icon: Icon(Icons.bookmark_border), onPressed: _onBookmarkPressed);

  @override
  Widget buildBody(BuildContext context) {
    return DefaultTabController(
      length: DashboardTopTab.values.length,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              tabs: DashboardTopTab.values.map((tab) => tab.widget).toList(),
            ),
            Expanded(
              child: TabBarView(
                children: DashboardTopTab.values.map((tab) {
                  // Replace with your actual tab content widgets
                  return tab.tabBarContent;
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onBookmarkPressed() {
    Get.toNamed(AppRouter.savedWorkouts, arguments: mockWorkouts);
  }
}
