class WorkoutModel {
  final String id;
  final String name;
  final String description;
  final int duration; // in minutes
  final List<String> exercises;

  WorkoutModel({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.exercises,
  });

  @override
  String toString() {
    return 'WorkoutModel{id: $id, name: $name, description: $description, duration: $duration, exercises: $exercises}';
  }
}