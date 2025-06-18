import 'package:flutter/material.dart';
import 'package:flutter_training/features/dashboard/tab_contents/activity/activity_viewmodel.dart';
import 'package:flutter_training/widgets/app_divider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/model/activity.dart';
import '../../../../widgets/number_and_subtitle.dart';
import '../../../../widgets/tiles/activity_item.dart';

class HistoryTabContent extends ConsumerWidget {
  const HistoryTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(activityViewModelProvider);
    final activitiesVM = ref.read(activityViewModelProvider.notifier);

    final totalActivitiesText = NumberAndSubtitle(
      number: activitiesVM.totalCount,
      numberFontSize: 48.0,
      subtitle: 'Total Activities',
    );
    final totalMinutesText = NumberAndSubtitle(
      number: activitiesVM.totalDurationInMinutes,
      numberFontSize: 16.0,
      subtitle: 'Total Minutes',
    );

    final filterRow = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('All Activity', style: TextStyle(fontSize: 16)),
          IconButton(icon: const Icon(Icons.tune), onPressed: () {}),
        ],
      ),
    );

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                totalActivitiesText,
                const SizedBox(height: 16),
                totalMinutesText,
                const SizedBox(height: 24),
                const AppDivider(),
                filterRow,
                const AppDivider(),
              ],
            ),
          ),
        ),
        ..._buildGroupedSlivers(activitiesVM.activitiesGroupedByMonth),
      ],
    );
  }
}

List<Widget> _buildGroupedSlivers(Map<String, List<Activity>> grouped) {
  return grouped.entries.map((entry) {
    final title = entry.key;
    final group = entry.value;

    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        ...group.map((a) => ActivityItem(activity: a)),
      ]),
    );
  }).toList();
}
