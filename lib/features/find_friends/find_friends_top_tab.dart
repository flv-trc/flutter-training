import 'package:flutter/material.dart';
import 'contacts_tab.dart';

enum FindFriendsTopTab {
  suggested,
  contacts;

  Widget get tabBarContent {
    switch (this) {
      case FindFriendsTopTab.suggested:
        return Center(child: Text("Suggested"));
      case FindFriendsTopTab.contacts:
        return ContactsTab();
    }
  }

  String get title {
    return name.toUpperCase();
  }
}
