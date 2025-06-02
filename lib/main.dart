import 'package:flutter/material.dart';
import 'routing/router.dart';
import 'package:get/get.dart';
import 'screens/root.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRouter.getPages,
      home: RootScreen(),
    );
  }
}