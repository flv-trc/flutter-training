import 'package:flutter/material.dart';
import 'package:flutter_training/features/dashboard/dashboard_workouts/dashboard_top_tab.dart';

import '../models/collection_model.dart';
import 'dashboard_collection_card.dart';

class CollectionCardList extends StatelessWidget {
  final List<CollectionModel> collections;

  const CollectionCardList({super.key, required this.collections});

  @override
  Widget build(BuildContext context) {
    final titleLabel = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        'Collections',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );

    final listView = ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: collections.length,
      separatorBuilder: (_, __) => const SizedBox(width: 1),
      itemBuilder: (context, index) {
        final collection = collections[index];
        return CollectionCard(collection: collection);
      },
    );

    final cardWidth = MediaQuery.of(context).size.width * 0.9;

    final viewAllButton = TextButton(
      onPressed: () {
        final controller = DefaultTabController.of(context);
        controller.animateTo(
          DashboardTopTab.collections.index,
        );
      },
      child: const Text(
        'View All',
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );

    final topRow = Row(children: [titleLabel, Spacer(), viewAllButton]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topRow,
        SizedBox(height: cardWidth * 9 / 16, child: listView),
      ],
    );
  }
}
