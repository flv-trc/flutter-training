import 'package:flutter/material.dart';
import 'package:flutter_training/features/dashboard/tab_contents/activity/add_activity/add_activity_page.dart';
import 'package:flutter_training/features/workout/workout_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../features/saved_workouts/saved_workouts.dart';
import '../features/workout/workout_page.dart';
import 'urls.dart';

import '../features/login/login_wrapper.dart';
import '../features/dashboard/dashboard_page.dart';
import '../screens/join.dart';
import '../screens/webview.dart';

class AppRouter {
  static const String join = '/join';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String googleWebView = '/googleWebView';
  static const String googleExternalUrl = '/googleExternalUrl';
  static const String workout = '/workout';
  static const String savedWorkouts = '/savedWorkouts';
  static const String addActivity = '/add_activity';

  static final List<GetPage> getPages = [
    GetPage(
      name: join,
      page: () => const JoinScreen(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: login,
      page: () => const Material(child: LoginWrapper()),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: dashboard,
      page: () => const DashboardScreen(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      transition: Transition.cupertino,
    ),
    GetPage(
      name: googleWebView,
      page: () => const WebViewScreen(url: Urls.google, title: 'Google'),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: googleExternalUrl,
      page: () => const _ExternalUrlPage(url: Urls.google),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: workout,
      page: () {
        final workout = Get.arguments as WorkoutModel;
        return WorkoutScreen(workout: workout);
      },
      transition: Transition.downToUp,
    ),
    GetPage(
      name: savedWorkouts,
      page: () {
        final savedWorkouts = Get.arguments as List<WorkoutModel>;
        return SavedWorkoutsScreen(savedWorkouts: savedWorkouts);
      },
      transition: Transition.cupertino,
    ),
    GetPage(
      name: addActivity,
      page: () => const AddActivityPage(),
      transition: Transition.cupertino
    )
  ];
}

class _ExternalUrlPage extends StatelessWidget {
  final String url;

  const _ExternalUrlPage({required this.url});

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(url);
    Future.microtask(() async {
      try {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } catch (e) {
        throw ('Could not launch $url');
      } finally {
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      }
    });
    return const SizedBox.shrink();
  }
}
