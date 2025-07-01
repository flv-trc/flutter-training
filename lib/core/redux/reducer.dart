import 'package:flutter_training/core/redux/actions.dart';

import 'app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is LoadWorkoutsAction) {
    return state.copyWith(workouts: action.workouts);
  } else if (action is ToggleFavoriteAction) {
    final updated = state.workouts.map((workout) {
      if (workout.id == action.workoutId) {
        return workout.copyWith(isFavorite: !workout.isFavorite);
      }
      return workout;
    }).toList();
    return state.copyWith(workouts: updated);
  } else if (action is SelectWorkoutAction) {
    return state.copyWith(selectedWorkout: action.workout);
  }

  return state;
}