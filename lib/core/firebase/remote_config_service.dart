import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initialize() async {
    await _remoteConfig.setDefaults(const {
      'welcome_message': 'Hello Remote Config',
    });

    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 0),
      ),
    );

    try {
      await _remoteConfig.fetchAndActivate();
    } catch (e) { 
      // To Do
    }
  }

  String get welcomeMessage => _remoteConfig.getString('welcome_message');
}
