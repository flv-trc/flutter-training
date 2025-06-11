import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/exercise_provider.dart';
import '../../../../../mock/mock_workouts.dart';
import '../../../dashboard_workouts/dashboard_card_list.dart';

class ForYouTabContent extends ConsumerWidget {
  const ForYouTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncExercises = ref.watch(
      exerciseProvider(const {'muscle': 'biceps', 'type': 'strength'}),
    );

    return asyncExercises.when(
      data: (exercises) {
        final populatedWorkouts = mockWorkouts
            .map(
              (workout) => workout.populateExercises(
                workout: workout,
                exercises: exercises,
              ),
            )
            .toList();

        return WorkoutCardList(
          title: "Recommended for You",
          workouts: populatedWorkouts,
          fillScreen: true,
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text("Error: $error")),
    );
  }
}
