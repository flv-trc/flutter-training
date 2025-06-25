import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/features/profile/profile_edit/profile_edit_model.dart';
import 'package:flutter_training/features/profile/profile_edit/profile_edit_notifier.dart';
import 'package:flutter_training/widgets/textfields.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileEditProvider);
    final profileNotifier = ref.read(profileEditProvider.notifier);

    return Scaffold(
      appBar: _appBar(context, profile, profileNotifier),
      body: _body(profile, profileNotifier),
    );
  }
}

extension ProfileEditPageWidgets on ProfileEditPage {
  SingleChildScrollView _body(
    ProfileEditState profile,
    ProfileEditStateNotifier profileNotifier,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.camera_alt, color: Colors.white, size: 30),
                ),
                SizedBox(height: 8),
                Text('Edit', style: TextStyle(color: Colors.grey)),
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

  PreferredSize _appBar(
    BuildContext context,
    ProfileEditState profile,
    ProfileEditStateNotifier profileNotifier,
  ) {
    final saveButton = TextButton(
      onPressed: profile.hasChanged
          ? () {
              profileNotifier.commit();
              Navigator.of(context).pop();
            }
          : null,
      child: Text(
        'Save',
        style: TextStyle(
          color: profile.hasChanged ? Colors.blue : Colors.grey,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
    
    final cancelButton = TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      onPressed: () => Navigator.of(context).pop(),
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
}
