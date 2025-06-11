import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/exercise_provider.dart';
import '../../../../../mock/mock_collections.dart';
import '../../../../../mock/mock_workouts.dart';
import '../../../dashboard_workouts/dashboard_card_list.dart';
import '../../../dashboard_workouts/dashboard_collection_list.dart';

class BrowseTabContent extends ConsumerWidget {
  const BrowseTabContent({super.key});

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

        final populatedCollections = mockCollections
            .map(
              (collection) => collection.populateWorkouts(
                workouts: populatedWorkouts,
                collection: collection,
              ),
            )
            .toList();

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WorkoutCardList(
                title: "Top Picks for You",
                workouts: populatedWorkouts,
                fillScreen: false,
              ),
              CollectionCardList(collections: populatedCollections),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text("Error: $error")),
    );
  }
}