import 'package:flutter/material.dart';

import '../../domain/model/activity.dart';

class ActivityItem extends StatelessWidget {
  final Activity activity;

  const ActivityItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          activity.imageUrl,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => const Icon(Icons.image_not_supported),
        ),
      ),
      title: Text(activity.title),
      subtitle: Text(
        '${activity.formattedDate}, ${activity.formattedDuration}',
      ),
    );
  }
}
