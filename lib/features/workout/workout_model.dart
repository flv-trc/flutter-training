import 'package:flutter_training/domain/model/exercise.dart';

class WorkoutModel {
  final String id;
  final String name;
  final int duration; // in minutes
  final List<Exercise> exercises;
  final bool isFavorite;
  final String difficultyLevel;
  final String? imageUrl;
  final String? requiredEquipment;
  final String type;

  WorkoutModel({
    required this.id,
    required this.name,
    required this.duration,
    required this.exercises,
    required this.isFavorite,
    required this.difficultyLevel,
    this.imageUrl,
    this.requiredEquipment,
    this.type = 'Undefined',
  });

  @override
  String toString() {
    return 'WorkoutModel{id: $id, name: $name, duration: $duration, exercises: $exercises, isFavorite: $isFavorite, difficultyLevel: $difficultyLevel, imageUrl: $imageUrl, requiredEquipment: $requiredEquipment, type: $type}';
  }

  WorkoutModel populateExercises({
    required WorkoutModel workout,
    required List<Exercise> exercises,
  }) {
    return WorkoutModel(
      id: workout.id,
      name: workout.name,
      isFavorite: workout.isFavorite,
      duration: workout.duration,
      exercises: exercises,
      difficultyLevel: workout.difficultyLevel,
      imageUrl: workout.imageUrl ?? '',
      requiredEquipment: workout.requiredEquipment ?? '',
      type: workout.type,
    );
  }
}
