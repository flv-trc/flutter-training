import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/model/activity.dart';

class AddActivityPage extends ConsumerWidget {
  const AddActivityPage({super.key});

  @override
  Widget build(BuildContext, WidgetRef ref) {
    final _ = ref.watch(addActivityViewModelProvider);
    final viewModel = ref.read(addActivityViewModelProvider.notifier);
    return Center();
  }
}

final addActivityViewModelProvider =
    StateNotifierProvider<AddActivityViewModel, Activity>(
      (ref) => AddActivityViewModel(),
    );

class AddActivityViewModel extends StateNotifier<Activity> {
  AddActivityViewModel()
    : super(
        Activity(
          type: ActivityType.basketball,
          date: DateTime.now(),
          duration: const Duration(minutes: 30),
        ),
      );

  void setTitle(ActivityType type) {
    state = Activity(
      type: type,
      date: state.date,
      duration: state.duration,
    );
  }

  void setDate(DateTime date) {
    state = Activity(
      type: state.type,
      date: date,
      duration: state.duration,
    );
  }

  void setDuration(Duration duration) {
    state = Activity(
      type: state.type,
      date: state.date,
      duration: duration,
    );
  }
}
