import '../../workout/workout_model.dart';

class CollectionModel {
  final String id;
  final String name;
  final List<WorkoutModel> workouts;
  final String? imageUrl;
  final String difficultyLevel;

  CollectionModel({
    required this.id,
    required this.name,
    required this.workouts,
    required this.imageUrl,
    required this.difficultyLevel,
  });

  CollectionModel populateWorkouts({
    required CollectionModel collection,
    required List<WorkoutModel> workouts,
  }) {
    return CollectionModel(
      id: collection.id,
      name: collection.name,
      workouts: workouts,
      imageUrl: collection.imageUrl ?? '',
      difficultyLevel: collection.difficultyLevel,
    );
  }
}
