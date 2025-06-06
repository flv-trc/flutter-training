import 'package:flutter/material.dart';

import '../../../core/base/dashboard_base_tab_page.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';

class DashboardWorkoutsScreen extends DashboardBaseTabScreen {
  const DashboardWorkoutsScreen({super.key});

  @override
  AppNavigationBarItem get barItem => AppNavigationBarItem.workouts;

  @override
  Widget? get trailingItem => const Icon(Icons.bookmark_border);

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
                return Center(child: Text('${tab.label} Content'));
              }).toList(),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

enum DashboardTopTab {
  forYou("For You"),
  browse("Browse"),
  collecitions("Collections"),
  plans("Plans");

  final String label;
  const DashboardTopTab(this.label);

  Widget get widget {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Text(label, style: TextStyle(fontSize: 16)),
    );
  }
}
