import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'profile_model.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, Profile>(
  (ref) => ProfileNotifier(),
);

class ProfileNotifier extends StateNotifier<Profile> {
  ProfileNotifier()
    : super(
        Profile(
          username: 'Test User',
          imagePath: '',
          memberSince: DateTime(2020, 3),
          friends: [],
        ),
      );

  void updateImagePath(String path) {
    state = state.copyWith(imagePath: path);
  }

  void updateUsername(String username) {
    state = state.copyWith(username: username);
  }
}
