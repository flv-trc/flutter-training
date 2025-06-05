import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/app_bottom_navigation_bar.dart';

import '../../../core/base/dashboard_base_tab_page.dart';

class DashboardActivityScreen extends DashboardBaseTabScreen {
  const DashboardActivityScreen({super.key});

  @override
  AppNavigationBarItem get barItem => AppNavigationBarItem.activity;
  
  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Text(
        "Activity Screen",
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}