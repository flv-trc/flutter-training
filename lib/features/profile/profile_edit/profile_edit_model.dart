import 'package:flutter_training/features/profile/profile_model.dart';

class ProfileEditState {
  final Profile original;
  final Profile current;

  ProfileEditState({required this.original, required this.current});

  bool get _hasChanged => original != current;
  bool get _validateData => current.firstName.isNotEmpty && current.lastName.isNotEmpty;
  bool get saveEnabled => _hasChanged && _validateData;

  ProfileEditState copyWith({Profile? original, Profile? current}) {
    return ProfileEditState(
      original: original ?? this.original,
      current: current ?? this.current,
    );
  }
}