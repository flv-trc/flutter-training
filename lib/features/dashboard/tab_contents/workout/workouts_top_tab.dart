import 'package:flutter/material.dart';

import 'top_tab_content/browse_tab_content.dart';
import 'top_tab_content/for_you_tab_content.dart';

enum WorkoutsTopTab {
  forYou("For You"),
  browse("Browse"),
  collections("Collections"),
  plans("Plans");

  final String label;
  const WorkoutsTopTab(this.label);

  Widget get widget {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Text(label, style: TextStyle(fontSize: 16)),
    );
  }

  Widget get tabBarContent {
    switch (this) {
      case WorkoutsTopTab.forYou:
        return ForYouTabContent();
      case WorkoutsTopTab.browse:
        return BrowseTabContent();
      case WorkoutsTopTab.collections:
        return Center(child: Text("Collections Content"));
      case WorkoutsTopTab.plans:
        return Center(child: Text("Plans Content"));
    }
  }
}
