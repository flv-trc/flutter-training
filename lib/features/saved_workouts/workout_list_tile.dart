import 'package:flutter/material.dart';

import '../workout/workout_model.dart';

class WorkoutListTile extends StatelessWidget {
  const WorkoutListTile({super.key, required this.workout});

  final WorkoutModel workout;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [imageWithDurationOverlay, workoutInfo],
        ),
      ),
    );
  }

  Expanded get workoutInfo {
    var workoutName = Text(
      workout.name,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
    var workoutInfo = Text(
      '${workout.difficultyLevel} • ${workout.requiredEquipment} • ${workout.type}',
      style: const TextStyle(color: Colors.black54, fontSize: 13),
    );
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [workoutName, workoutInfo],
      ),
    );
  }

  Stack get imageWithDurationOverlay {
    const shadows = [
      Shadow(color: Colors.black54, offset: Offset(0, 1), blurRadius: 4),
    ];

    final image = Image.asset(
      workout.imageUrl ?? '',
      width: 80,
      height: 80,
      fit: BoxFit.cover,
    );

    final shadowOverlay = Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(color: Colors.black54),
    );

    final durationText = Text(
      '${workout.duration}',
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        shadows: shadows,
      ),
    );

    final minText = const Text(
      'min',
      style: TextStyle(color: Colors.white, fontSize: 14, shadows: shadows),
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(borderRadius: BorderRadius.zero, child: image),
        shadowOverlay,
        Positioned(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [durationText, minText],
          ),
        ),
      ],
    );
  }
}
