import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'profile_edit_model.dart';
import 'profile_edit_notifier.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/textfields.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileEditProvider);
    final profileNotifier = ref.read(profileEditProvider.notifier);

    return Scaffold(
      appBar: _appBar(context, profile, profileNotifier),
      body: _body(context, profile, profileNotifier),
    );
  }
}

extension ProfileEditPageWidgets on ProfileEditPage {
  SingleChildScrollView _body(
    BuildContext context,
    ProfileEditState profile,
    ProfileEditStateNotifier profileNotifier,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => _showImagePickerOptions(context, profileNotifier),
            child: Column(
              children: [
                _profileAvatar(profile.current.imagePath),
                SizedBox(height: 8),
                Text('Edit', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SecondaryTextField(
            label: 'Name',
            initialValue: profile.current.firstName,
            onChanged: profileNotifier.updateFirstName,
          ),
          const SizedBox(height: 10),
          SecondaryTextField(
            label: '',
            initialValue: profile.current.lastName,
            onChanged: profileNotifier.updateLastName,
          ),
          const SizedBox(height: 20),
          SecondaryTextField(
            label: 'Hometown',
            initialValue: profile.current.hometown,
            hint: 'Town/City, Country/Region',
            onChanged: profileNotifier.updateHometown,
          ),
          const SizedBox(height: 20),
          SecondaryTextField(
            label: 'Bio',
            initialValue: profile.current.bio,
            hint: '150 characters',
            maxLines: 4,
            maxLength: 150,
            onChanged: profileNotifier.updateBio,
          ),
        ],
      ),
    );
  }

  CircleAvatar _profileAvatar(String imagePath) {
    return imagePath.isEmpty
        ? const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 40, color: Colors.white),
          )
        : CircleAvatar(radius: 40, backgroundImage: FileImage(File(imagePath)));
  }

  PreferredSize _appBar(
    BuildContext context,
    ProfileEditState profile,
    ProfileEditStateNotifier profileNotifier,
  ) {
    final saveButton = TextButton(
      onPressed: profile.saveEnabled
          ? () {
              profileNotifier.commit();
              Navigator.of(context).pop();
            }
          : null,
      child: Text(
        'Save',
        style: TextStyle(
          color: profile.saveEnabled ? Colors.blue : Colors.grey,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    final cancelButton = TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      onPressed: () {
        profileNotifier.reset();
        Navigator.of(context).pop();
      },
      child: const Text(
        'Cancel',
        style: TextStyle(color: Colors.blue, fontSize: 17),
      ),
    );

    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Container(
        color: Colors.grey.shade300,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.bottomCenter,
        child: Row(children: [cancelButton, const Spacer(), saveButton]),
      ),
    );
  }

  Future<void> _showImagePickerOptions(
    BuildContext context,
    ProfileEditStateNotifier profileEditNotifier,
  ) async {
    final picker = ImagePicker();

    await showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final image = await picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 85,
                  );
                  if (image != null) {
                    profileEditNotifier.updateImage(image, false);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Photo'),
                onTap: () async {
                  Navigator.pop(context);
                  final image = await picker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 85,
                  );
                  if (image != null) {
                    profileEditNotifier.updateImage(image, true);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
