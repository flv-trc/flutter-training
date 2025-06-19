import 'package:flutter/material.dart';
import 'package:flutter_training/extensions/app_date_time.dart';

import '../../domain/model/activity.dart';

class ActivityItem extends StatelessWidget {
  final Activity activity;

  const ActivityItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      leading: (activity.type.imageUrl != null)
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                activity.type.imageUrl ?? "",
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    const Icon(Icons.image_not_supported),
              ),
            )
          : null,
      title: Text(activity.type.displayName),
      subtitle: Text(
        '${activity.date.appFormattedDate}, ${activity.formattedDuration}',
      ),
    );
  }
}
