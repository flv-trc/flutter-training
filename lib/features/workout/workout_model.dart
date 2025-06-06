class WorkoutModel {
  final String id;
  final String name;
  final String description;
  final int duration; // in minutes
  final List<String> exercises;
  final bool isFavorite;
  final String difficultyLevel;
  final String? imageUrl;
  

  WorkoutModel({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.exercises,
    required this.isFavorite,
    required this.difficultyLevel,
    this.imageUrl,
  });

  @override
  String toString() {
    return 'WorkoutModel{id: $id, name: $name, description: $description, duration: $duration, exercises: $exercises}';
  }
}