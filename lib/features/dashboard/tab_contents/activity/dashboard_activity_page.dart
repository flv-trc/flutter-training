import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/core/router/router.gr.dart';

import '../../../../core/base/dashboard_base_tab_page.dart';
import '../../../../widgets/app_bottom_navigation_bar.dart';
import 'activity_top_tab.dart';

class DashboardActivityScreen extends DashboardBaseTabScreen {
  const DashboardActivityScreen({super.key});

  @override
  AppNavigationBarItem get barItem => AppNavigationBarItem.activity;

  @override
  Widget? trailingItem(BuildContext context) => IconButton(
    onPressed: () => context.pushRoute(AddActivityRoute()),
    icon: Icon(Icons.add),
  );

  @override
  Widget buildBody(BuildContext context) {
    return buildTabView<ActivityTopTab>(
      tabs: ActivityTopTab.values,
      buildTabWidgets: (tabs) => tabs.map((tab) => tab.widget).toList(),
      buildTabContents: (tabs) => tabs.map((tab) => tab.tabBarContent).toList(),
    );
  }
}
