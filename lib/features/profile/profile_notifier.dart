import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'profile_model.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, Profile>(
  (ref) => ProfileNotifier(),
);

class ProfileNotifier extends StateNotifier<Profile> {
  ProfileNotifier()
    : super(
        Profile(
          firstName: 'Test',
          lastName: 'User',
          imagePath: '',
          memberSince: DateTime(2020, 3),
          friends: [],
          bio: '',
          hometown: '',
        ),
      );
}
