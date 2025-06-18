import 'package:flutter/material.dart';

import 'history_tab_content.dart';

enum ActivityTopTab {
  history("History"),
  achievements("Achievements");

  final String label;
  const ActivityTopTab(this.label);

  Widget get widget {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Text(label, style: TextStyle(fontSize: 16)),
    );
  }

  Widget get tabBarContent {
    switch (this) {
      case ActivityTopTab.history:
        return HistoryTabContent();
      case ActivityTopTab.achievements:
        return Center(child: Text("Achievements"));
    }
  }
}