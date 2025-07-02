import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page|Wrapper,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: RootRoute.page, initial: true),

    AutoRoute(page: LoginRoute.page, fullscreenDialog: true),
    AutoRoute(page: JoinRoute.page, fullscreenDialog: true),

    AutoRoute(page: DashboardRoute.page),
    AutoRoute(page: WorkoutRoute.page),
    AutoRoute(page: SavedWorkoutsRoute.page),

    AutoRoute(page: AddActivityRoute.page),
    AutoRoute(page: ActivityInfoRoute.page),

    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: ProfileEditRoute.page),
    AutoRoute(page: ProfilePassRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: FindFriendsRoute.page),
    AutoRoute(page: SearchFriendsRoute.page),
    AutoRoute(page: ContactDetailsRoute.page),

    AutoRoute(page: ExternalUrlRoute.page),
    AutoRoute(page: WebViewRoute.page),
  ];
}

@RoutePage()
class ExternalUrlPage extends StatelessWidget {
  final String url;

  const ExternalUrlPage({super.key, required this.url});

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
          context.router.pop();
        }
      }
    });
    return const SizedBox.shrink();
  }
}
