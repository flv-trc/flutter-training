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

  String get ddmmyyyyFormat {
    return '${day.toString().padLeft(2, '0')}.${month.toString().padLeft(2, '0')}.$year';
  }

  String get appFormatTime {
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String get monthYear {
    return '${months[month -1]} $year';
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
