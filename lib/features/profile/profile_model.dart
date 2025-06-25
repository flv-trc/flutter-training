import 'package:flutter_training/extensions/app_date_time.dart';

class Profile {
  final String firstName;
  final String lastName;
  final String imagePath;
  final DateTime memberSince;
  final String bio;
  final String hometown;
  final List<String> friends;

  Profile({
    required this.firstName,
    required this.lastName,
    required this.imagePath,
    required this.memberSince,
    required this.bio,
    required this.hometown,
    required this.friends,
  });

  Profile copyWith({
    String? firstName,
    String? lastName,
    String? imagePath,
    DateTime? memberSince,
    String? bio,
    String? hometown,
    List<String>? friends,
  }) {
    return Profile(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      imagePath: imagePath ?? this.imagePath,
      memberSince: memberSince ?? this.memberSince,
      bio: bio ?? this.bio,
      hometown: hometown ?? this.hometown,
      friends: friends ?? this.friends,
    );
  }

  String get formattedJoinedDate {
    return 'Member Since ${memberSince.monthYear}';
  }

  String get fullName {
    return '$firstName $lastName';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Profile &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          hometown == other.hometown &&
          bio == other.bio;

  @override
  int get hashCode => Object.hash(firstName, lastName, hometown, bio);
}
