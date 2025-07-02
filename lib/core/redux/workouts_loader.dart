import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'actions.dart';
import 'app_state.dart';
import '../../domain/exercise_provider.dart';
import '../../features/workout/workout_model.dart';
import '../../mock/mock_workouts.dart';

abstract class WorkoutsLoader extends ConsumerStatefulWidget {
  const WorkoutsLoader({super.key});

  /// Override to specify the filter used in `exerciseProvider`
  Map<String, String> get exerciseFilter;

  /// Override to render whatever view you need with final workouts
  Widget buildWithWorkouts(BuildContext context, List<WorkoutModel> workouts);

  @override
  ConsumerState<WorkoutsLoader> createState() => _WorkoutLoaderState();
}

class _WorkoutLoaderState extends ConsumerState<WorkoutsLoader> {
  bool _dispatched = false;

  @override
  build(BuildContext context) {
    final asyncExercises = ref.watch(exerciseProvider(widget.exerciseFilter));

    return asyncExercises.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
      data: (exercises) {
        if (!_dispatched && StoreProvider.of<AppState>(context).state.workouts.isEmpty) {
          final populatedWorkouts = mockWorkouts
              .map((w) => w.populateExercises(workout: w, exercises: exercises))
              .toList();

          StoreProvider.of<AppState>(
            context,
          ).dispatch(LoadWorkoutsAction(populatedWorkouts));

          _dispatched = true;
        }

        return StoreConnector<AppState, List<WorkoutModel>>(
          converter: (store) => store.state.workouts,
          builder: (context, workouts) =>
              widget.buildWithWorkouts(context, workouts),
        );
      },
    );
  }
}
