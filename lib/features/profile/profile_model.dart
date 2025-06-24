import 'package:flutter_training/extensions/app_date_time.dart';

class Profile {
  final String username;
  final String imagePath;
  final DateTime memberSince;
  final List<String> friends;

  Profile({
    required this.username,
    required this.imagePath,
    required this.memberSince,
    required this.friends,
  });

  Profile copyWith({
    String? username,
    String? imagePath,
    DateTime? memberSince,
    List<String>? friends,
  }) {
    return Profile(
      username: username ?? this.username,
      imagePath: imagePath ?? this.imagePath,
      memberSince: memberSince ?? this.memberSince,
      friends: friends ?? this.friends,
    );
  }

  String get formattedJoinedDate {
    return 'Member Since ${memberSince.monthYear}';
  }
}
