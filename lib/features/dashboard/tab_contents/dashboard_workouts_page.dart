import 'package:flutter/material.dart';
import 'package:flutter_training/mock/mock_workouts.dart';
import 'package:get/get.dart';

import '../../../core/base/dashboard_base_tab_page.dart';
import '../../../routing/router.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
import 'workout/workouts_top_tab.dart';

class DashboardWorkoutsScreen extends DashboardBaseTabScreen {
  const DashboardWorkoutsScreen({super.key});

  @override
  AppNavigationBarItem get barItem => AppNavigationBarItem.workouts;

  @override
  Widget? get trailingItem => IconButton(icon: Icon(Icons.bookmark_border), onPressed: _onBookmarkPressed);

  @override
  Widget buildBody(BuildContext context) {
    return buildTabView<WorkoutsTopTab>(
      tabs: WorkoutsTopTab.values,
      buildTabWidgets: (tabs) => tabs.map((tab) => tab.widget).toList(),
      buildTabContents: (tabs) => tabs.map((tab) => tab.tabBarContent).toList(),
    );
  }

  void _onBookmarkPressed() {
    Get.toNamed(AppRouter.savedWorkouts, arguments: mockWorkouts);
  }
}
