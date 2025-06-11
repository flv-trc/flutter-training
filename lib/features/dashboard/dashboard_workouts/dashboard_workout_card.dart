import 'package:flutter/material.dart';

import '../../../routing/exports.dart';
import '../../workout/workout_model.dart';

class WorkoutCard extends StatefulWidget {
  final WorkoutModel workout;
  final double cardWidth;
  const WorkoutCard({
    super.key,
    required this.workout,
    required this.cardWidth,
  });

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.workout.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookmarkButton = IconButton(
      icon: Container(
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        padding: const EdgeInsets.all(6),
        child: Icon(
          isFavorite ? Icons.bookmark : Icons.bookmark_border,
          color: Colors.black,
          size: 28,
        ),
      ),
      onPressed: _toggleFavorite,
      splashRadius: 24,
    );

    final title = Text(
      widget.workout.name,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        shadows: [
          Shadow(color: Colors.black54, offset: Offset(0, 1), blurRadius: 4),
        ],
      ),
    );

    final subtitle = Text(
      '${widget.workout.duration} min, ${widget.workout.difficultyLevel}',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        shadows: [
          Shadow(color: Colors.black54, offset: Offset(0, 1), blurRadius: 4),
        ],
      ),
    );

    return SizedBox(
      width: widget.cardWidth,
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRouter.workout, arguments: widget.workout);
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: Stack(
            children: [
              Positioned.fill(
                child: widget.workout.imageUrl != null
                    ? Image.asset(widget.workout.imageUrl!, fit: BoxFit.cover)
                    : Container(color: Colors.black26),
              ),

              Positioned(top: 12, right: 12, child: bookmarkButton),

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
      ),
    );
  }
}
