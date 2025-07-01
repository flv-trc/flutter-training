import 'dart:async';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'core/firebase/analytics_service.dart';
import 'core/redux/app_state.dart';
import 'core/redux/reducer.dart';
import 'firebase_options.dart';
import 'routing/app_route_observer.dart';
import 'routing/exports.dart';
import 'screens/root.dart';

final routeObserver = AppRouteObserver();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runZonedGuarded(
    () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(),
      );

      runApp(
        ProviderScope(
          child: StoreProvider<AppState>(
            store: store,
            child: const MainApp(),
          ),
        ),
      );
    },
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
