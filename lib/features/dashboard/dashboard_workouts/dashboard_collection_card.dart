import 'package:flutter/material.dart';

import '../models/collection_model.dart';

class CollectionCard extends StatelessWidget {
  final CollectionModel collection;

  const CollectionCard({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    final title = Text(
      collection.name,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        height: 1.1,
        shadows: [
          Shadow(color: Colors.black54, offset: Offset(0, 1), blurRadius: 4),
        ],
      ),
    );

    final subtitle = Text(
      '${collection.workouts.length} Workouts - ${collection.difficultyLevel}',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        shadows: [
          Shadow(color: Colors.black54, offset: Offset(0, 1), blurRadius: 4),
        ],
      ),
    );

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Stack(
          children: [
            Positioned.fill(
              child: collection.imageUrl != null
                  ? Image.asset(collection.imageUrl!, fit: BoxFit.cover)
                  : Container(color: Colors.grey),
            ),
      
            // Gradient overlay for text readability
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black54,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
      
            Positioned(
              left: 16,
              right: 16,
              bottom: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [title, subtitle],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
