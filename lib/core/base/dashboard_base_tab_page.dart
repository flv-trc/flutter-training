import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/core/router/router.gr.dart';

import '../../widgets/app_bottom_navigation_bar.dart';

abstract class DashboardBaseTabScreen extends StatelessWidget {
  const DashboardBaseTabScreen({super.key});

  AppNavigationBarItem get barItem;
  Widget? trailingItem(BuildContext context) => null;

  Widget buildBody(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        backgroundColor: Colors.white,
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              leading: InkWell(
                onTap: () => context.pushRoute(ProfileRoute()),
                child: const Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: 40,
                ),
              ),
              largeTitle: Text(barItem.label),
              trailing: trailingItem(context),
            ),

            SliverFillRemaining(child: buildBody(context)),
          ],
        ),
      ),
    );
  }

  Widget buildTabView<T extends Enum>({
    required List<T> tabs,
    required List<Widget> Function(List<T>) buildTabWidgets,
    required List<Widget> Function(List<T>) buildTabContents,
  }) {
    return DefaultTabController(
      length: tabs.length,
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
              tabs: buildTabWidgets(tabs),
            ),
            Expanded(child: TabBarView(children: buildTabContents(tabs))),
          ],
        ),
      ),
    );
  }
}
