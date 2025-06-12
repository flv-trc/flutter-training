import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/core/firebase/analytics_service.dart';
import 'package:flutter_training/firebase_options.dart';
import 'routing/app_route_observer.dart';
import 'routing/exports.dart';
import 'screens/root.dart';
import 'package:firebase_core/firebase_core.dart';

final routeObserver = AppRouteObserver();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runZonedGuarded(
    () => runApp(ProviderScope(child: const MainApp())),
    FirebaseCrashlytics.instance.recordError,
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRouter.getPages,
      home: RootScreen(),
      navigatorObservers: [routeObserver, AnalyticsService().analyticsObserver],
    );
  }
}
