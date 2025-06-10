import 'package:flutter/material.dart';
import '../../workout/workout_model.dart';
import 'dashboard_workout_card.dart';

class WorkoutCardList extends StatelessWidget {
  final List<WorkoutModel> workouts;
  final String title;
  final bool fillScreen;

  const WorkoutCardList({
    super.key,
    required this.workouts,
    required this.title,
    required this.fillScreen,
  });

  @override
  Widget build(BuildContext context) {
    final titleLabel = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = fillScreen
            ? constraints.maxWidth
            : constraints.maxWidth * 0.7;

        final listView = ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: workouts.length,
          separatorBuilder: (_, __) => const SizedBox(width: 1),
          itemBuilder: (context, index) {
            final workout = workouts[index];
            return WorkoutCard(workout: workout, cardWidth: cardWidth);
          },
        );

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              titleLabel,
              fillScreen
                  ? Expanded(child: listView)
                  : SizedBox(height: cardWidth * 5 / 4, child: listView),
            ],
          ),
        );
      },
    );
  }
}
