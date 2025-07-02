import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_divider.dart';
import '../workout/workout_model.dart';
import 'workout_list_tile.dart';

@RoutePage()
class SavedWorkoutsScreen extends StatelessWidget {
  final List<WorkoutModel> savedWorkouts;
  const SavedWorkoutsScreen({super.key, required this.savedWorkouts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Saved Workouts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    separatorBuilder(BuildContext context, int index) {
      return const AppDivider();
    }

    itemBuilder(BuildContext context, int index) {
      final workout = savedWorkouts[index];
      return WorkoutListTile(workout: workout);
    }

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
          itemCount: savedWorkouts.length,
        ),
      ),
    );
  }
}