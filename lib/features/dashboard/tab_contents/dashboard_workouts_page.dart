import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_training/core/redux/app_state.dart';
import 'package:flutter_training/core/router/router.gr.dart';

import '../../../core/base/dashboard_base_tab_page.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
import 'workout/workouts_top_tab.dart';

class DashboardWorkoutsScreen extends DashboardBaseTabScreen {
  const DashboardWorkoutsScreen({super.key});

  @override
  AppNavigationBarItem get barItem => AppNavigationBarItem.workouts;

  @override
  Widget? trailingItem(BuildContext context) => IconButton(
    icon: Icon(Icons.bookmark_border),
    onPressed: () => _onBookmarkPressed(context),
  );

  @override
  Widget buildBody(BuildContext context) {
    return buildTabView<WorkoutsTopTab>(
      tabs: WorkoutsTopTab.values,
      buildTabWidgets: (tabs) => tabs.map((tab) => tab.widget).toList(),
      buildTabContents: (tabs) => tabs.map((tab) => tab.tabBarContent).toList(),
    );
  }

  void _onBookmarkPressed(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    final favoriteWorkouts = store.state.workouts
        .where((w) => w.isFavorite)
        .toList();
        
    context.pushRoute(SavedWorkoutsRoute(savedWorkouts: favoriteWorkouts));
  }
}
