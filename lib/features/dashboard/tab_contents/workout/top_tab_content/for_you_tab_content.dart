import 'package:flutter/material.dart';
import 'package:flutter_training/features/dashboard/dashboard_workouts/dashboard_card_list.dart';
import 'package:flutter_training/features/workout/workout_model.dart';

import '../../../../../core/redux/workouts_loader.dart';

class ForYouTabContent extends WorkoutsLoader {
  const ForYouTabContent({super.key});

  @override
  Map<String, String> get exerciseFilter => const {
    'muscle': 'biceps',
    'type': 'strength',
  };

  @override
  Widget buildWithWorkouts(BuildContext context, List<WorkoutModel> workouts) {
    return WorkoutCardList(
      workouts: workouts,
      title: 'Recommended for You',
      fillScreen: true,
    );
  }
}
