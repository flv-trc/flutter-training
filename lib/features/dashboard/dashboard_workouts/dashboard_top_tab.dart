import 'package:flutter/material.dart';

import '../tab_contents/workout/top_tab_content/browse_tab_content.dart';
import '../tab_contents/workout/top_tab_content/for_you_tab_content.dart';

enum DashboardTopTab {
  forYou("For You"),
  browse("Browse"),
  collections("Collections"),
  plans("Plans");

  final String label;
  const DashboardTopTab(this.label);

  Widget get widget {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Text(label, style: TextStyle(fontSize: 16)),
    );
  }

  Widget get tabBarContent {
    switch (this) {
      case DashboardTopTab.forYou:
        return ForYouTabContent();
      case DashboardTopTab.browse:
        return BrowseTabContent();
      case DashboardTopTab.collections:
        return Center(child: Text("Collections Content"));
      case DashboardTopTab.plans:
        return Center(child: Text("Plans Content"));
    }
  }
}
