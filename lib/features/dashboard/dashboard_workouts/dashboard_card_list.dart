import 'package:flutter/material.dart';
import '../../workout/workout_model.dart';
import 'dashboard_workout_card.dart';

class DashboardCardList extends StatelessWidget {
  final String title;
  final List<WorkoutModel> workouts;
  final bool fillScreen;

  const DashboardCardList({
    super.key,
    required this.title,
    required this.workouts,
    required this.fillScreen,
  });

  @override
  Widget build(BuildContext context) {
    final text = Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );

    final cardWidth = fillScreen
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.width * 0.7;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: text,
          ),
          fillScreen
              ? Expanded(
                  child: WorkoutCardList(
                    workouts: workouts,
                    cardWidth: cardWidth,
                  ),
                )
              : SizedBox(
                  height: 250,
                  child: WorkoutCardList(
                    workouts: workouts,
                    cardWidth: cardWidth,
                  ),
                ),
        ],
      ),
    );
  }
}

class WorkoutCardList extends StatelessWidget {
  final List<WorkoutModel> workouts;
  final double cardWidth;
  const WorkoutCardList({
    super.key,
    required this.workouts,
    required this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: workouts.length,
      separatorBuilder: (_, __) => const SizedBox(width: 1),
      itemBuilder: (context, index) {
        final workout = workouts[index];
        return WorkoutCard(workout: workout, cardWidth: cardWidth);
      },
    );
  }
}