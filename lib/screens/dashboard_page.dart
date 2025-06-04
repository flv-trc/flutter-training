import 'package:flutter/material.dart';
import 'package:flutter_training/core/base/base_page.dart';

class DashboardScreen extends BaseScreen {
  const DashboardScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const Center(child: Text('Dashboard Page'));
  }

  @override
  Color get appBarColor => Colors.teal;

  @override
  String get title => 'Dashboard';

  @override
  get automaticallyImplyLeading => false;
}
