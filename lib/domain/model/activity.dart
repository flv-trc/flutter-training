import '../../extensions/app_date_time.dart';
import '../../resources/images.dart';

class Activity {
  final ActivityType type;
  final DateTime date;
  final Duration duration;

  const Activity({
    required this.type,
    required this.date,
    required this.duration,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      type: ActivityType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => throw ArgumentError('Unknown activity type'),
      ),
      date: DateTime.parse(json['date']),
      duration: Duration(minutes: json['durationMinutes']),
    );
  }

  String get formattedDuration {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    return '${duration.inHours > 0 ? '${duration.inHours}:' : ''}$minutes:00';
  }

  String get fullMonth {
    return AppDateTime.months[date.month];
  }
}

enum ActivityType {
  none("Select"),
  americanFootball("American Football"),
  basketball("Basketball"),
  cycling("Cycling"),
  running("Running"),
  swimming("Swimming");

  final String displayName;
  const ActivityType(this.displayName);
}

extension ActivityTypeInfo on ActivityType {
  String? get imageUrl {
    switch (this) {
      case ActivityType.none:
        return null;
      case ActivityType.americanFootball:
        return Images.workouts[0];
      case ActivityType.basketball:
        return Images.workouts[1];
      case ActivityType.cycling:
        return Images.workouts[2];
      case ActivityType.running:
        return Images.workouts[3];
      case ActivityType.swimming:
        return Images.workouts[4];
    }
  }
}