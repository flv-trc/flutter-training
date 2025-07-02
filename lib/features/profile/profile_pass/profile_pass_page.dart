import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screen_brightness/screen_brightness.dart';
import '../profile_model.dart';
import '../profile_notifier.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, Profile>(
  (ref) => ProfileNotifier(),
);

@RoutePage()
class ProfilePassPage extends ConsumerStatefulWidget {
  const ProfilePassPage({super.key});

  @override
  ConsumerState<ProfilePassPage> createState() => _ProfilePassPageState();
}

class _ProfilePassPageState extends ConsumerState<ProfilePassPage> {
  @override
  void initState() {
    super.initState();
    _setMaxBrightness();
  }

  @override
  void dispose() {
    _resetBrightness();
    super.dispose();
  }

  Future<void> _setMaxBrightness() async {
    try {
      await ScreenBrightness().setApplicationScreenBrightness(1.0);
    } catch (_) {}
  }

  Future<void> _resetBrightness() async {
    try {
      await ScreenBrightness().resetApplicationScreenBrightness();
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);

    return Scaffold(
      appBar: _appBar,
      body: Column(
        children: [
          const SizedBox(height: 16),
          _mainBody(profile),
          const SizedBox(height: 24),
          bottomInfo,
        ],
      ),
    );
  }
}

extension _ProfilePassPageStateWidgets on _ProfilePassPageState {
  AppBar get _appBar {
    return AppBar(
      title: const Text('PASS', style: TextStyle(fontWeight: FontWeight.w500)),
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0.5,
    );
  }

  Container _mainBody(Profile profile) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Text(
            profile.fullName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            profile.formattedJoinedDate,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          QrImageView(
            data: profile.firstName + profile.lastName,
            size: 220,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Padding get bottomInfo {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'Check in easily and get personalised service at Nike stores and events. Learn more.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade600,
          height: 1.4,
        ),
      ),
    );
  }
}
