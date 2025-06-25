import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../profile_model.dart';
import '../profile_notifier.dart';
import 'profile_edit_model.dart';

final profileEditProvider =
    StateNotifierProvider<ProfileEditStateNotifier, ProfileEditState>((ref) {
      final profile = ref.watch(profileProvider);
      return ProfileEditStateNotifier(profile);
    });

class ProfileEditStateNotifier extends StateNotifier<ProfileEditState> {
  ProfileEditStateNotifier(Profile profile)
    : super(
        ProfileEditState(
          original: Profile(
            firstName: 'Test',
            lastName: 'User',
            imagePath: '',
            memberSince: DateTime(2020, 3),
            bio: '',
            hometown: '',
            friends: [],
          ),
          current: Profile(
            firstName: 'Test',
            lastName: 'User',
            imagePath: '',
            memberSince: DateTime(2020, 3),
            bio: '',
            hometown: '',
            friends: [],
          ),
        ),
      );

  void updateFirstName(String value) {
    state = state.copyWith(current: state.current.copyWith(firstName: value));
  }

  void updateLastName(String value) {
    state = state.copyWith(current: state.current.copyWith(lastName: value));
  }

  void updateHometown(String value) {
    state = state.copyWith(current: state.current.copyWith(hometown: value));
  }

  void updateBio(String value) {
    state = state.copyWith(current: state.current.copyWith(bio: value));
  }

  void reset() {
    state = ProfileEditState(original: state.original, current: state.original);
  }

  void commit() {
    state = ProfileEditState(original: state.current, current: state.current);
  }
}
