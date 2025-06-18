import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../../../domain/model/activity.dart';

final activityViewModelProvider =
    StateNotifierProvider<ActivityViewModel, List<Activity>>(
      (ref) => ActivityViewModel().._loadActivities(),
    );

class ActivityViewModel extends StateNotifier<List<Activity>> {
  ActivityViewModel() : super([]);

  void _loadActivities() async {
    final response = await DioClient.instance.get("/activities");
    final data = response.data as List<dynamic>;
    state = data.map((e) => Activity.fromJson(e)).toList();
  }

  Map<String, List<Activity>> get activitiesGroupedByMonth {
    final Map<String, List<Activity>> grouped = {};
    final sorted = state.toList()..sort((a, b) => b.date.compareTo(a.date));

    for (final activity in sorted) {
      final key = '${activity.fullMonth} ${activity.date.year}';
      grouped.putIfAbsent(key, () => []).add(activity);
    }

    return grouped;
  }

  int get totalDurationInMinutes => state
      .fold(Duration.zero, (total, activity) => total + activity.duration)
      .inMinutes;

  int get totalCount => state.length;
}
