import 'package:flutter_training/mock/mock_workouts.dart';

import '../features/dashboard/models/collection_model.dart';
import '../resources/images.dart';

final mockCollections = [
      CollectionModel(
        id: '1',
        name: "Yoga for Beginners",
        workouts: mockWorkouts,
        imageUrl: Images.workouts3,
        difficultyLevel: 'All levels',
      ),
      CollectionModel(
        id: '2',
        name: "Cardio Blast",
        workouts: mockWorkouts,
        imageUrl: Images.workouts4,
        difficultyLevel: 'Intermediate',
      ),
      CollectionModel(
        id: '3',
        name: "Strength & Conditioning",
        workouts: mockWorkouts,
        imageUrl: Images.workouts5,
        difficultyLevel: 'Advanced',
      ),
    ];