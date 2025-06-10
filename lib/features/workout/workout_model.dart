class WorkoutModel {
  final String id;
  final String name;
  final String description;
  final int duration; // in minutes
  final List<String> exercises;
  final bool isFavorite;
  final String difficultyLevel;
  final String? imageUrl;
  final String? requiredEquipment;
  final String type;

  WorkoutModel({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.exercises,
    required this.isFavorite,
    required this.difficultyLevel,
    this.imageUrl,
    this.requiredEquipment,
    this.type = 'Undefined',
  });

  @override
  String toString() {
    return 'WorkoutModel{id: $id, name: $name, description: $description, duration: $duration, exercises: $exercises, isFavorite: $isFavorite, difficultyLevel: $difficultyLevel, imageUrl: $imageUrl, requiredEquipment: $requiredEquipment, type: $type}';
  }
}
