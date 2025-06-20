import 'package:flutter/material.dart';
import 'package:flutter_training/extensions/app_date_time.dart';
import 'package:flutter_training/extensions/app_duration.dart';
import 'package:flutter_training/widgets/app_divider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../domain/model/activity.dart';

class ActivityInfoScreen extends StatelessWidget {
  final Activity activity;

  const ActivityInfoScreen({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _activityAppBar,
      body: Column(
        children: [
          Expanded(child: _activityMainContainer),
          const SizedBox(height: 24),
          _durationSection,
          const SizedBox(height: 32),
          _bottomSection,
        ],
      ),
    );
  }

  AppBar get _activityAppBar {
    return AppBar(
      title: Text(
        activity.date.ddmmyyyyFormat,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: const BackButton(),
      actions: [
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {
            final message =
                '🏀 ${activity.type.displayName}\n'
                '📅 ${activity.date.ddmmyyyyFormat}\n'
                '⏱️ ${activity.duration.appFormattedDuration}';

            SharePlus.instance.share(
              ShareParams(text: message, subject: 'Summary'),
            );
          },
        ),
      ],
    );
  }

  Column get _durationSection {
    return Column(
      children: [
        Text(
          activity.duration.appFormattedDuration,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 4),
        const Text('Duration', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  SafeArea get _bottomSection {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _InfoTile(icon: Icons.speed, title: 'Hard', subtitle: 'Effort'),
            _InfoTile(
              icon: Icons.sports_baseball_outlined,
              title: 'Gym',
              subtitle: 'Location',
            ),
          ],
        ),
      ),
    );
  }

  Container get _activityMainContainer {
    final divider = const AppDivider(
      indent: 64,
      endIndent: 64,
      color: Colors.white,
    );

    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          if (activity.type.imageUrl != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Image.asset(
                activity.type.imageUrl!,
                width: 300,
                height: 300,
              ),
            ),
          divider,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              activity.type.displayName,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          divider,
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 36),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
