import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/extensions/app_date_time.dart';
import 'package:flutter_training/extensions/app_duration.dart';
import 'package:flutter_training/features/dashboard/tab_contents/activity/activity_viewmodel.dart';

import '../../../../../domain/model/activity.dart';

final addActivityViewModelProvider =
    StateNotifierProvider<AddActivityViewModel, Activity>(
      (ref) => AddActivityViewModel(ref),
    );

class AddActivityViewModel extends StateNotifier<Activity> {
  AddActivityViewModel(this._ref)
    : super(
        Activity(
          type: ActivityType.basketball,
          date: DateTime.now(),
          duration: const Duration(minutes: 30),
        ),
      );

  final Ref _ref;

  String get displayName {
    return state.type.displayName;
  }

  String get displayDate {
    return '${state.date.appFormattedDate} / ${state.date.appFormatTime}';
  }

  Duration get duration {
    return state.duration;
  }

  DateTime get date {
    return state.date;
  }

  String get displayDuration {
    return state.duration.appFormattedDuration;
  }

  int get durationInHours {
    return state.duration.inHours;
  }

  int get durationInMinutes {
    return state.duration.inMinutes.remainder(60).toInt();
  }

  int get durationInSeconds {
    return state.duration.inSeconds.remainder(60).toInt();
  }

  bool get canSave {
    return state.type != ActivityType.none &&
        state.duration.inSeconds > 0 &&
        state.date.isAfter(DateTime.now());
  }

  void setType(ActivityType type) {
    state = Activity(type: type, date: state.date, duration: state.duration);
  }

  void setDate(DateTime date) {
    state = Activity(type: state.type, date: date, duration: state.duration);
  }

  void setDuration(Duration duration) {
    state = Activity(type: state.type, date: state.date, duration: duration);
  }

  void saveActivity() {
    _ref.read(activityViewModelProvider.notifier).add(state);
  }
}
