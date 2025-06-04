import 'package:flutter/material.dart';

import 'base_page.dart';

abstract class WorkoutBaseScreen extends BaseScreen {
  const WorkoutBaseScreen({super.key});

  @override
  String get title => 'Workout';

  @override
  Color get appBarColor => Colors.blue;

  @override
  bool get automaticallyImplyLeading => true;

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Text(
        'Workout Base Page',
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}