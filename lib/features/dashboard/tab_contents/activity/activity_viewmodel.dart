import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../../../domain/model/activity.dart';

final activityViewModelProvider =
    StateNotifierProvider<ActivityViewModel, List<Activity>>(
      (ref) => ActivityViewModel().._loadActivities(),
    );

class ActivityViewModel extends StateNotifier<List<Activity>> {
  ActivityViewModel() : super([]);

  ActivityType selectedFilterType = ActivityType.none;
  ActivityType prospectiveFilterType = ActivityType.none;

  void _loadActivities() async {
    final response = await DioClient.instance.get("/activities");
    final data = response.data as List<dynamic>;
    state = data.map((e) => Activity.fromJson(e)).toList();
  }

  Map<String, List<Activity>> get activitiesGroupedByMonth {
    final filtered = _filterActivities(state, selectedFilterType);
    final Map<String, List<Activity>> grouped = {};
    final sorted = filtered..sort((a, b) => b.date.compareTo(a.date));

    for (final activity in sorted) {
      final key = '${activity.fullMonth} ${activity.date.year}';
      grouped.putIfAbsent(key, () => []).add(activity);
    }

    return grouped;
  }

  List<ActivityType> get activityTypes =>
      state.map((a) => a.type).toSet().toList();

  int get totalDurationInMinutes => state
      .fold(Duration.zero, (total, activity) => total + activity.duration)
      .inMinutes;

  int get totalCount => state.length;

  bool get applyFilterEnabled => selectedFilterType != prospectiveFilterType;

  void add(Activity activity) {
    state = [...state, activity];
  }

  void applyFilter() {
    selectedFilterType = prospectiveFilterType;
    state = [...state];
  }

  List<Activity> _filterActivities(
    List<Activity> activities,
    ActivityType filterType,
  ) {
    if (filterType == ActivityType.none) {
      return activities;
    }

    return activities.where((activity) => activity.type == filterType).toList();
  }
}
