import '../../features/workout/workout_model.dart';

class LoadWorkoutsAction {
  final List<WorkoutModel> workouts;
  LoadWorkoutsAction(this.workouts);
}

class ToggleFavoriteAction {
  final String workoutId;
  ToggleFavoriteAction(this.workoutId);
}

class SelectWorkoutAction {
  final WorkoutModel workout;
  SelectWorkoutAction(this.workout);
}