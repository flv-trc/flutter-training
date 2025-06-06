import 'package:flutter/material.dart';

import '../../../core/base/dashboard_base_tab_page.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';

class DashboardFeedScreen extends DashboardBaseTabScreen {
  const DashboardFeedScreen({super.key});

  @override
  AppNavigationBarItem get barItem => AppNavigationBarItem.feed;

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Text(
        "Feed Screen",
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}