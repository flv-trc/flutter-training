import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/core/router/router.gr.dart';
import 'package:flutter_training/features/profile/profile_model.dart';
import 'package:flutter_training/features/profile/profile_notifier.dart';
import 'package:flutter_training/widgets/app_divider.dart';
import 'package:flutter_training/widgets/buttons.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final profileNotifier = ref.read(profileProvider.notifier);
    return Scaffold(
      body: SafeArea(child: mainVStack(context, profile, profileNotifier)),
    );
  }

  void _onEditProfile(BuildContext context) =>
      context.pushRoute(ProfileEditRoute());

  void _onAddFriends(BuildContext context) =>
      context.pushRoute(FindFriendsRoute());

  void _onTapPass(BuildContext context) =>
      context.pushRoute(ProfilePassRoute());

  void _onTapSettings(BuildContext context) =>
      context.pushRoute(SettingsRoute());
}

extension ProfilePageWidgets on ProfilePage {
  Widget mainVStack(
    BuildContext context,
    Profile profile,
    ProfileNotifier profileNotifier,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  topBar(context),
                  profileAvatar(profile.imagePath),
                  username(profile.fullName),
                  _editProfileButton(context),
                  _tabs(context),
                  AppDivider(indent: 16, endIndent: 16),
                  _friendsSection(context, profile),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Padding topBar(BuildContext context) {
    onPressed() => Navigator.pop(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [closeButton(onPressed: onPressed)],
      ),
    );
  }

  Padding profileAvatar(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: imagePath.isEmpty
          ? const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            )
          : CircleAvatar(
              radius: 40,
              backgroundImage: FileImage(File(imagePath)),
            ),
    );
  }

  Padding username(String username) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Text(
        username.toUpperCase(),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Padding _editProfileButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: SizedBox(
        width: double.infinity,
        child: flatTransparentButton(
          label: 'EDIT PROFILE',
          onPressed: () => _onEditProfile(context),
        ),
      ),
    );
  }

  Padding _tabs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => _onTapPass(context),
            child: Column(
              spacing: 4,
              children: const [Icon(Icons.badge_outlined), Text('Pass')],
            ),
          ),

          Container(height: 40, width: 1, color: Colors.black12),

          InkWell(
            onTap: () => _onTapSettings(context),
            child: Column(
              spacing: 4,
              children: const [Icon(Icons.settings_outlined), Text('Settings')],
            ),
          ),
        ],
      ),
    );
  }

  Padding _friendsSection(BuildContext context, Profile profile) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          const Text(
            'FRIENDS',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: flatTransparentButton(
                label: 'ADD FRIENDS',
                onPressed: () => _onAddFriends(context),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(16),
            child: Text(
              profile.formattedJoinedDate,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
