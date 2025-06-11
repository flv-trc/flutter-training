import 'package:flutter/material.dart';

import '../../core/base/base_page.dart';
import 'workout_model.dart';

class WorkoutScreen extends BaseScreen {
  final WorkoutModel workout;

  const WorkoutScreen({super.key, required this.workout});

  @override
  String get title => workout.name;

  @override
  Color get appBarColor => Colors.green;

  Widget? get _workoutImage {
    if (workout.imageUrl == null) return null;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(workout.imageUrl!, fit: BoxFit.cover),
    );
  }

  Widget? get _equipment {
    if (workout.requiredEquipment == null) return null;
    return Text(
      'Equipment: ${workout.requiredEquipment}',
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget? get _exercises {
    if (workout.exercises.isEmpty) return null;
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Exercises:',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      ...workout.exercises.map(
        (e) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                e.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('Type: ${e.type}'),
              Text('Muscle: ${e.muscle}'),
              Text('Equipment: ${e.equipment}'),
              Text('Difficulty: ${e.difficulty}'),
              Text('Instructions: ${e.instructions}'),
            ],
          ),
        ),
      ),
    ],
  );
  }

  @override
  Widget buildBody(BuildContext context) {
    var duration = Text(
      'Duration: ${workout.duration} min',
      style: const TextStyle(fontSize: 16),
    );
    var type = Text(
      'Type: ${workout.type}',
      style: const TextStyle(fontSize: 16),
    );
    var difficulty = Text(
      'Difficulty: ${workout.difficultyLevel}',
      style: const TextStyle(fontSize: 16),
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          ?_workoutImage,
          duration,
          difficulty,
          ?_equipment,
          type,
          ?_exercises,
        ],
      ),
    );
  }
}
