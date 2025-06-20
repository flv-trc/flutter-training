import 'package:flutter/material.dart';
import 'package:flutter_training/features/dashboard/tab_contents/activity/activity_viewmodel.dart';
import 'package:flutter_training/widgets/app_divider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/widgets/buttons.dart';

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

    onFilterPressed() => _onFilterPressed(context, activitiesVM);

    final filterRow = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('All Activity', style: TextStyle(fontSize: 16)),
          IconButton(icon: const Icon(Icons.tune), onPressed: onFilterPressed),
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

  void _onFilterPressed(BuildContext context, ActivityViewModel viewModel) {
    ActivityType prospectiveType = viewModel.prospectiveFilterType;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Select",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...ActivityType.values
                      .where(
                        (type) =>
                            type != ActivityType.none &&
                            viewModel.activityTypes.contains(type),
                      )
                      .map((type) {
                        return RadioListTile<ActivityType>(
                          title: Text(type.displayName),
                          value: type,
                          groupValue: prospectiveType,
                          onChanged: (ActivityType? newValue) {
                            if (newValue != null) {
                              setState(() => prospectiveType = newValue);
                              viewModel.prospectiveFilterType = newValue;
                            }
                          },
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: flatBlackButton(
                      onPressed: () {
                        viewModel.applyFilter();
                        Navigator.pop(context);
                      },
                      label: 'Apply Filter',
                      enabled: viewModel.applyFilterEnabled,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
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
