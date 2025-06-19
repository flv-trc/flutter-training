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

  String get formattedDate {
    return '${_weekdays[date.weekday]}, ${date.day} ${_months[date.month].substring(0, 3)}';
  }

  String get formattedDuration {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    return '${duration.inHours > 0 ? '${duration.inHours}:' : ''}$minutes:00';
  }

  String get fullMonth {
    return _months[date.month];
  }

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

  static const _months = [
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
}

enum ActivityType {
  americanFootball("American Football"),
  basketball("Basketball"),
  cycling("Cycling"),
  running("Running"),
  swimming("Swimming"),
  yoga("Yoga");

  final String displayName;
  const ActivityType(this.displayName);
}

extension ActivityTypeInfo on ActivityType {
  String get imageUrl {
    switch (this) {
      case ActivityType.americanFootball:
        return "https://cdn-icons-png.flaticon.com/512/1162/1162506.png";
      case ActivityType.basketball:
        return "https://cdn-icons-png.flaticon.com/512/201/201818.png";
      case ActivityType.cycling:
        return "https://cdn-icons-png.flaticon.com/512/747/747310.png";
      case ActivityType.running:
        return "https://cdn-icons-png.flaticon.com/512/2965/2965567.png";
      case ActivityType.swimming:
        return "https://cdn-icons-png.flaticon.com/512/3179/3179068.png";
      case ActivityType.yoga:
        return "https://cdn-icons-png.flaticon.com/512/2947/2947416.png";
    }
  }
}
