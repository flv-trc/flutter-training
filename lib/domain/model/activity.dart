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

extension AppDuration on Duration {
  String get appFormattedDuration {
  final hours = inHours;
  final minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = inSeconds.remainder(60).toString().padLeft(2, '0');

  return hours > 0
      ? '$hours:$minutes:$seconds'
      : '$minutes:$seconds';
}
}

extension AppDateTime on DateTime {
  String get appFormattedDate {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final diff = difference(today).inDays;

    if (diff == 0) return 'Today';
    if (diff == -1) return 'Yesterday';
    if (diff == 1) return 'Tomorrow';

    final dayOfWeek = _weekdays[weekday];
    final monthShort = months[month].substring(0, 3);


    return '$dayOfWeek, $day $monthShort';
  }

  String get appFormatTime {
    final h = hour.toString().padLeft(2, '0');
    final m = hour.toString().padLeft(2, '0');
    return '$h:$m';
  }

  static const months = [
    '',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static const List<String> _weekdays = [
    '',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];
}