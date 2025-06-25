import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import '../profile_model.dart';
import '../profile_notifier.dart';
import 'profile_edit_model.dart';

final profileEditProvider =
    StateNotifierProvider<ProfileEditStateNotifier, ProfileEditState>((ref) {
      final initialProfile = ref.watch(profileProvider);
      return ProfileEditStateNotifier(ref: ref, initialProfile: initialProfile);
    });

class ProfileEditStateNotifier extends StateNotifier<ProfileEditState> {
  final Ref _ref;

  ProfileEditStateNotifier({required Ref ref, required Profile initialProfile})
    : _ref = ref,
      super(
        ProfileEditState(original: initialProfile, current: initialProfile),
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

  Future<void> updateImage(XFile newImage, bool saveToGallery) async {
    final dir = await getApplicationDocumentsDirectory();

    final newPath = p.join(
      dir.path,
      'profile_image${p.extension(newImage.path)}',
    );
    final savedImage = await File(newImage.path).copy(newPath);

    state = state.copyWith(
      current: state.current.copyWith(imagePath: savedImage.path),
    );
  }

  void reset() {
    state = ProfileEditState(original: state.original, current: state.original);
  }

  void commit() {
    final updated = state.current;
    state = ProfileEditState(original: updated, current: updated);
    _ref.read(profileProvider.notifier).setProfile(updated);
  }
}
