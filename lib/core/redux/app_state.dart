import '../../features/workout/workout_model.dart';

class AppState {
  final List<WorkoutModel> workouts;
  final WorkoutModel? selectedWorkout;

  AppState({this.workouts = const [], this.selectedWorkout});

  AppState copyWith({
    List<WorkoutModel>? workouts,
    WorkoutModel? selectedWorkout,
  }) {
    return AppState(
      workouts: workouts ?? this.workouts,
      selectedWorkout: selectedWorkout ?? this.selectedWorkout,
    );
  }
}
