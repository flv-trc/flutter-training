import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bottom_navigation_bar.dart';

abstract class DashboardBaseTabScreen extends StatelessWidget {
  const DashboardBaseTabScreen({super.key});

  AppNavigationBarItem get barItem;
  Widget? get trailingItem => null;

  Widget buildBody(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            leading: const Icon(Icons.account_circle, color: Colors.grey, size: 40),
            largeTitle: Text(barItem.label),
            trailing: trailingItem,
          ),

          SliverFillRemaining(
            child: buildBody(context)
          ),
        ],
      ),
    ),
    );
  }
}
