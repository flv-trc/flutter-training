import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routing/app_route_observer.dart';
import 'routing/router.dart';
import 'package:get/get.dart';
import 'screens/root.dart';

final routeObserver = AppRouteObserver();

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRouter.getPages,
      home: RootScreen(),
      navigatorObservers: [routeObserver]
    );
  }
}