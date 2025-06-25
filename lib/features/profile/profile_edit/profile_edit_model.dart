import 'package:flutter_training/features/profile/profile_model.dart';

class ProfileEditState {
  final Profile original;
  final Profile current;

  ProfileEditState({required this.original, required this.current});

  bool get hasChanged => original != current;

  ProfileEditState copyWith({Profile? original, Profile? current}) {
    return ProfileEditState(
      original: original ?? this.original,
      current: current ?? this.current,
    );
  }
}