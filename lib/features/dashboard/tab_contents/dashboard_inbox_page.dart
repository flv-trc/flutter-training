import 'package:flutter/material.dart';

import '../../../core/base/dashboard_base_tab_page.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';

class DashboardInboxScreen extends DashboardBaseTabScreen {
  const DashboardInboxScreen({super.key});

  @override
  AppNavigationBarItem get barItem => AppNavigationBarItem.inbox;

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Text(
        "Inbox Screen",
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}