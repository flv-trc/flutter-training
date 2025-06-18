class Activity {
  final String title;
  final DateTime date;
  final Duration duration;
  final String imageUrl;

  const Activity({
    required this.title,
    required this.date,
    required this.duration,
    required this.imageUrl,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      duration: Duration(minutes: json['durationMinutes'] as int),
      imageUrl: json['imageUrl'],
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
