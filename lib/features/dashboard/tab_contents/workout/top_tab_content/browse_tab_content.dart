import 'package:flutter/material.dart';

import '../../../../../mock/mock_collections.dart';
import '../../../dashboard_workouts/dashboard_card_list.dart';
import '../../../dashboard_workouts/dashboard_collection_list.dart';
import '../../../../../core/redux/workouts_loader.dart';
import '../../../models/collection_model.dart';
import '../../../../workout/workout_model.dart';

class BrowseTabContent extends WorkoutsLoader {
  const BrowseTabContent({super.key});

  @override
  Map<String, String> get exerciseFilter => const {
    'muscle': 'biceps',
    'type': 'strength',
  };

  @override
  Widget buildWithWorkouts(BuildContext context, List<WorkoutModel> workouts) {
    final collections = mockCollections
        .map(
          (collection) => collection.populateWorkouts(
            workouts: workouts,
            collection: collection,
          ),
        )
        .toList();

    return _singleChildScrollView(workouts, collections);
  }

  SingleChildScrollView _singleChildScrollView(
    List<WorkoutModel> workouts,
    List<CollectionModel> collections,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WorkoutCardList(
            title: "Top Picks for You",
            workouts: workouts,
            fillScreen: false,
          ),
          CollectionCardList(collections: collections),
        ],
      ),
    );
  }
}
