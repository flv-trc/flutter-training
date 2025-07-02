import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/core/firebase/authentication_service.dart';
import 'package:flutter_training/screens/root.dart';

@RoutePage()
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final items = [
      'Country/Region',
      'Language',
      'Shopping Settings',
      null, // Divider
      'About this Version',
      'Terms of Use',
      'Privacy Policy',
      'App FAQs',
      'Contact Us',
      null, // Divider
    ];

    return Scaffold(
      appBar: _appBar,
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length + 1,
                itemBuilder: (context, index) {
                  if (index < items.length) {
                    final item = items[index];
                    if (item == null) {
                      return const SizedBox(height: 16);
                    }
                    return Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(item, style: const TextStyle(fontSize: 15)),
                        trailing: const Icon(Icons.chevron_right, size: 20),
                        onTap: () {},
                      ),
                    );
                  } else {
                    return _logOutContainer(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogout() async {
    await ref.read(authServiceProvider).logout();

    if (!mounted) return;

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const RootScreen(showLoginOnStart: true),
      ),
      (route) => false,
    );
  }
}

extension _SettingsPageWidgets on _SettingsPageState {
  Container _logOutContainer(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Center(
        child: TextButton(
          onPressed: _handleLogout,
          child: const Text(
            'Log Out',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  AppBar get _appBar {
    return AppBar(
      title: const Text(
        'SETTINGS',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0.5,
    );
  }
}
