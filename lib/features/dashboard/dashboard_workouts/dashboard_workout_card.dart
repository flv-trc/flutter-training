import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_training/core/redux/actions.dart';
import 'package:flutter_training/core/redux/app_state.dart';
import 'package:flutter_training/core/router/router.gr.dart';
import 'package:redux/redux.dart';

import '../../workout/workout_model.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutModel workout;
  final double cardWidth;

  const WorkoutCard({
    super.key,
    required this.workout,
    required this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _WorkoutCardViewModel>(
      builder: (_, vm) => _workoutCard(context, vm),
      converter: (Store<AppState> store) {
        final updatedWorkout = store.state.workouts.firstWhere(
          (w) => w.id == workout.id,
          orElse: () => workout,
        );
        return _WorkoutCardViewModel(
          isFavorite: updatedWorkout.isFavorite,
          toggleFavorite: () =>
              store.dispatch(ToggleFavoriteAction(workout.id)),
        );
      },
    );
  }
}

extension _WorkoutCardExtension on WorkoutCard {
  Widget _workoutCard(BuildContext context, _WorkoutCardViewModel vm) {
    final bookmarkButton = IconButton(
      icon: Container(
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        padding: const EdgeInsets.all(6),
        child: Icon(
          vm.isFavorite ? Icons.bookmark : Icons.bookmark_border,
          color: Colors.black,
          size: 28,
        ),
      ),
      onPressed: vm.toggleFavorite,
      splashRadius: 24,
    );

    final title = Text(
      workout.name,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        shadows: [
          Shadow(color: Colors.black54, offset: Offset(0, 1), blurRadius: 4),
        ],
      ),
    );

    final subtitle = Text(
      '${workout.duration} min, ${workout.difficultyLevel}',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        shadows: [
          Shadow(color: Colors.black54, offset: Offset(0, 1), blurRadius: 4),
        ],
      ),
    );

    final card = Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Stack(
        children: [
          Positioned.fill(
            child: workout.imageUrl != null
                ? Image.asset(workout.imageUrl!, fit: BoxFit.cover)
                : Container(color: Colors.black26),
          ),

          Positioned(top: 12, right: 12, child: bookmarkButton),

          Positioned(
            left: 16,
            right: 16,
            bottom: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [title, subtitle],
            ),
          ),
        ],
      ),
    );

    return SizedBox(
      width: cardWidth,
      child: InkWell(
        onTap: () => context.pushRoute(WorkoutRoute(workout: workout)),
        child: card,
      ),
    );
  }
}

class _WorkoutCardViewModel {
  final bool isFavorite;
  final VoidCallback toggleFavorite;

  _WorkoutCardViewModel({
    required this.isFavorite,
    required this.toggleFavorite,
  });
}
