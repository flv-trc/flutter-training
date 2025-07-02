import 'dart:async';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'core/redux/app_state.dart';
import 'core/redux/reducer.dart';
import 'firebase_options.dart';
import 'core/firebase/analytics_service.dart';
import 'core/router/router.dart';
import 'core/router/app_route_observer.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    final store = Store<AppState>(appReducer, initialState: AppState());

    runApp(
      ProviderScope(
        child: StoreProvider<AppState>(store: store, child: MainApp()),
      ),
    );
  }, (erorr, stack) => FirebaseCrashlytics.instance.recordError);
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          AppRouteObserver(),
          AnalyticsService().analyticsObserver,
        ],
      ),
    );
  }
}
