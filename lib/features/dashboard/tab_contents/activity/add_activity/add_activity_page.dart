import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/widgets/buttons.dart';
import 'package:flutter_training/widgets/platform_duration_picker.dart';

import '../../../../../domain/model/activity.dart';
import '../../../../../widgets/app_divider.dart';
import '../../../../../widgets/platform_date_time_picker.dart';
import 'add_avitivity_viewmodel.dart';

class AddActivityPage extends ConsumerWidget {
  const AddActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(addActivityViewModelProvider);
    final viewModel = ref.read(addActivityViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Activity'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          AppDivider(),
          ListTile(
            title: const Text('Activity Type'),
            trailing: Text(viewModel.displayName),
            onTap: () => _pickActivity(context, viewModel),
          ),
          AppDivider(),
          ListTile(
            title: const Text('Date'),
            trailing: Text(viewModel.displayDate),
            onTap: () => _pickDate(context, viewModel),
          ),
          AppDivider(),
          ListTile(
            title: const Text('Duration'),
            trailing: Text(viewModel.displayDuration),
            onTap: () => _pickDuration(context, viewModel),
          ),
          AppDivider(),
          Spacer(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: flatBlackButton(
                  onPressed: () {
                    viewModel.saveActivity();
                    Navigator.pop(context);
                  },
                  label: "Next",
                  enabled: viewModel.canSave
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _pickActivity(BuildContext context, AddActivityViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children: ActivityType.values.map((type) {
            return ListTile(
              leading: type.imageUrl != null
                  ? Image.asset(type.imageUrl ?? "", width: 40, height: 40)
                  : null,
              title: Text(type.displayName),
              onTap: () {
                viewModel.setType(type);
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _pickDuration(BuildContext context, AddActivityViewModel viewModel) {
    PlatformDurationPicker.show(
      context: context,
      initial: viewModel.duration,
      onConfirm: viewModel.setDuration,
    );
  }

  void _pickDate(BuildContext context, AddActivityViewModel viewModel) {
    PlatformDateTimePicker.show(
      context: context,
      initial: viewModel.date,
      onConfirm: viewModel.setDate,
    );
  }
}
