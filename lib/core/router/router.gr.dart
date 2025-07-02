// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:collection/collection.dart' as _i23;
import 'package:contacts_service/contacts_service.dart' as _i21;
import 'package:flutter/material.dart' as _i19;
import 'package:flutter_training/core/router/router.dart' as _i5;
import 'package:flutter_training/domain/model/activity.dart' as _i20;
import 'package:flutter_training/features/dashboard/dashboard_page.dart' as _i4;
import 'package:flutter_training/features/dashboard/tab_contents/activity/activity_info_dart.dart'
    as _i1;
import 'package:flutter_training/features/dashboard/tab_contents/activity/add_activity/add_activity_page.dart'
    as _i2;
import 'package:flutter_training/features/find_friends/contact_details_page.dart'
    as _i3;
import 'package:flutter_training/features/find_friends/find_friends_page.dart'
    as _i6;
import 'package:flutter_training/features/find_friends/search_friends_page.dart'
    as _i14;
import 'package:flutter_training/features/login/login_wrapper.dart' as _i8;
import 'package:flutter_training/features/profile/profile_edit/profile_edit_page.dart'
    as _i9;
import 'package:flutter_training/features/profile/profile_page.dart' as _i10;
import 'package:flutter_training/features/profile/profile_pass/profile_pass_page.dart'
    as _i11;
import 'package:flutter_training/features/saved_workouts/saved_workouts.dart'
    as _i13;
import 'package:flutter_training/features/settings/settings_page.dart' as _i15;
import 'package:flutter_training/features/workout/workout_model.dart' as _i22;
import 'package:flutter_training/features/workout/workout_page.dart' as _i17;
import 'package:flutter_training/screens/join.dart' as _i7;
import 'package:flutter_training/screens/root.dart' as _i12;
import 'package:flutter_training/screens/webview.dart' as _i16;

/// generated route for
/// [_i1.ActivityInfoScreen]
class ActivityInfoRoute extends _i18.PageRouteInfo<ActivityInfoRouteArgs> {
  ActivityInfoRoute({
    _i19.Key? key,
    required _i20.Activity activity,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         ActivityInfoRoute.name,
         args: ActivityInfoRouteArgs(key: key, activity: activity),
         initialChildren: children,
       );

  static const String name = 'ActivityInfoRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityInfoRouteArgs>();
      return _i1.ActivityInfoScreen(key: args.key, activity: args.activity);
    },
  );
}

class ActivityInfoRouteArgs {
  const ActivityInfoRouteArgs({this.key, required this.activity});

  final _i19.Key? key;

  final _i20.Activity activity;

  @override
  String toString() {
    return 'ActivityInfoRouteArgs{key: $key, activity: $activity}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ActivityInfoRouteArgs) return false;
    return key == other.key && activity == other.activity;
  }

  @override
  int get hashCode => key.hashCode ^ activity.hashCode;
}

/// generated route for
/// [_i2.AddActivityPage]
class AddActivityRoute extends _i18.PageRouteInfo<void> {
  const AddActivityRoute({List<_i18.PageRouteInfo>? children})
    : super(AddActivityRoute.name, initialChildren: children);

  static const String name = 'AddActivityRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddActivityPage();
    },
  );
}

/// generated route for
/// [_i3.ContactDetailsPage]
class ContactDetailsRoute extends _i18.PageRouteInfo<ContactDetailsRouteArgs> {
  ContactDetailsRoute({
    _i19.Key? key,
    required _i21.Contact contact,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         ContactDetailsRoute.name,
         args: ContactDetailsRouteArgs(key: key, contact: contact),
         initialChildren: children,
       );

  static const String name = 'ContactDetailsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ContactDetailsRouteArgs>();
      return _i3.ContactDetailsPage(key: args.key, contact: args.contact);
    },
  );
}

class ContactDetailsRouteArgs {
  const ContactDetailsRouteArgs({this.key, required this.contact});

  final _i19.Key? key;

  final _i21.Contact contact;

  @override
  String toString() {
    return 'ContactDetailsRouteArgs{key: $key, contact: $contact}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ContactDetailsRouteArgs) return false;
    return key == other.key && contact == other.contact;
  }

  @override
  int get hashCode => key.hashCode ^ contact.hashCode;
}

/// generated route for
/// [_i4.DashboardScreen]
class DashboardRoute extends _i18.PageRouteInfo<void> {
  const DashboardRoute({List<_i18.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i4.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i5.ExternalUrlPage]
class ExternalUrlRoute extends _i18.PageRouteInfo<ExternalUrlRouteArgs> {
  ExternalUrlRoute({
    _i19.Key? key,
    required String url,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         ExternalUrlRoute.name,
         args: ExternalUrlRouteArgs(key: key, url: url),
         initialChildren: children,
       );

  static const String name = 'ExternalUrlRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExternalUrlRouteArgs>();
      return _i5.ExternalUrlPage(key: args.key, url: args.url);
    },
  );
}

class ExternalUrlRouteArgs {
  const ExternalUrlRouteArgs({this.key, required this.url});

  final _i19.Key? key;

  final String url;

  @override
  String toString() {
    return 'ExternalUrlRouteArgs{key: $key, url: $url}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ExternalUrlRouteArgs) return false;
    return key == other.key && url == other.url;
  }

  @override
  int get hashCode => key.hashCode ^ url.hashCode;
}

/// generated route for
/// [_i6.FindFriendsPage]
class FindFriendsRoute extends _i18.PageRouteInfo<void> {
  const FindFriendsRoute({List<_i18.PageRouteInfo>? children})
    : super(FindFriendsRoute.name, initialChildren: children);

  static const String name = 'FindFriendsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i6.FindFriendsPage();
    },
  );
}

/// generated route for
/// [_i7.JoinScreen]
class JoinRoute extends _i18.PageRouteInfo<void> {
  const JoinRoute({List<_i18.PageRouteInfo>? children})
    : super(JoinRoute.name, initialChildren: children);

  static const String name = 'JoinRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i7.JoinScreen();
    },
  );
}

/// generated route for
/// [_i8.LoginWrapper]
class LoginRoute extends _i18.PageRouteInfo<void> {
  const LoginRoute({List<_i18.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i8.LoginWrapper();
    },
  );
}

/// generated route for
/// [_i9.ProfileEditPage]
class ProfileEditRoute extends _i18.PageRouteInfo<void> {
  const ProfileEditRoute({List<_i18.PageRouteInfo>? children})
    : super(ProfileEditRoute.name, initialChildren: children);

  static const String name = 'ProfileEditRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfileEditPage();
    },
  );
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i18.PageRouteInfo<void> {
  const ProfileRoute({List<_i18.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfilePage();
    },
  );
}

/// generated route for
/// [_i11.ProfilePassPage]
class ProfilePassRoute extends _i18.PageRouteInfo<void> {
  const ProfilePassRoute({List<_i18.PageRouteInfo>? children})
    : super(ProfilePassRoute.name, initialChildren: children);

  static const String name = 'ProfilePassRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i11.ProfilePassPage();
    },
  );
}

/// generated route for
/// [_i12.RootScreen]
class RootRoute extends _i18.PageRouteInfo<RootRouteArgs> {
  RootRoute({
    _i19.Key? key,
    bool showLoginOnStart = false,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         RootRoute.name,
         args: RootRouteArgs(key: key, showLoginOnStart: showLoginOnStart),
         initialChildren: children,
       );

  static const String name = 'RootRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RootRouteArgs>(
        orElse: () => const RootRouteArgs(),
      );
      return _i12.RootScreen(
        key: args.key,
        showLoginOnStart: args.showLoginOnStart,
      );
    },
  );
}

class RootRouteArgs {
  const RootRouteArgs({this.key, this.showLoginOnStart = false});

  final _i19.Key? key;

  final bool showLoginOnStart;

  @override
  String toString() {
    return 'RootRouteArgs{key: $key, showLoginOnStart: $showLoginOnStart}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RootRouteArgs) return false;
    return key == other.key && showLoginOnStart == other.showLoginOnStart;
  }

  @override
  int get hashCode => key.hashCode ^ showLoginOnStart.hashCode;
}

/// generated route for
/// [_i13.SavedWorkoutsScreen]
class SavedWorkoutsRoute extends _i18.PageRouteInfo<SavedWorkoutsRouteArgs> {
  SavedWorkoutsRoute({
    _i19.Key? key,
    required List<_i22.WorkoutModel> savedWorkouts,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         SavedWorkoutsRoute.name,
         args: SavedWorkoutsRouteArgs(key: key, savedWorkouts: savedWorkouts),
         initialChildren: children,
       );

  static const String name = 'SavedWorkoutsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SavedWorkoutsRouteArgs>();
      return _i13.SavedWorkoutsScreen(
        key: args.key,
        savedWorkouts: args.savedWorkouts,
      );
    },
  );
}

class SavedWorkoutsRouteArgs {
  const SavedWorkoutsRouteArgs({this.key, required this.savedWorkouts});

  final _i19.Key? key;

  final List<_i22.WorkoutModel> savedWorkouts;

  @override
  String toString() {
    return 'SavedWorkoutsRouteArgs{key: $key, savedWorkouts: $savedWorkouts}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SavedWorkoutsRouteArgs) return false;
    return key == other.key &&
        const _i23.ListEquality().equals(savedWorkouts, other.savedWorkouts);
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i23.ListEquality().hash(savedWorkouts);
}

/// generated route for
/// [_i14.SearchFriendsPage]
class SearchFriendsRoute extends _i18.PageRouteInfo<void> {
  const SearchFriendsRoute({List<_i18.PageRouteInfo>? children})
    : super(SearchFriendsRoute.name, initialChildren: children);

  static const String name = 'SearchFriendsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i14.SearchFriendsPage();
    },
  );
}

/// generated route for
/// [_i15.SettingsPage]
class SettingsRoute extends _i18.PageRouteInfo<void> {
  const SettingsRoute({List<_i18.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i15.SettingsPage();
    },
  );
}

/// generated route for
/// [_i16.WebViewScreen]
class WebViewRoute extends _i18.PageRouteInfo<WebViewRouteArgs> {
  WebViewRoute({
    _i19.Key? key,
    required String url,
    required String title,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         WebViewRoute.name,
         args: WebViewRouteArgs(key: key, url: url, title: title),
         initialChildren: children,
       );

  static const String name = 'WebViewRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebViewRouteArgs>();
      return _i16.WebViewScreen(
        key: args.key,
        url: args.url,
        title: args.title,
      );
    },
  );
}

class WebViewRouteArgs {
  const WebViewRouteArgs({this.key, required this.url, required this.title});

  final _i19.Key? key;

  final String url;

  final String title;

  @override
  String toString() {
    return 'WebViewRouteArgs{key: $key, url: $url, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WebViewRouteArgs) return false;
    return key == other.key && url == other.url && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ url.hashCode ^ title.hashCode;
}

/// generated route for
/// [_i17.WorkoutScreen]
class WorkoutRoute extends _i18.PageRouteInfo<WorkoutRouteArgs> {
  WorkoutRoute({
    _i19.Key? key,
    required _i22.WorkoutModel workout,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         WorkoutRoute.name,
         args: WorkoutRouteArgs(key: key, workout: workout),
         initialChildren: children,
       );

  static const String name = 'WorkoutRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WorkoutRouteArgs>();
      return _i17.WorkoutScreen(key: args.key, workout: args.workout);
    },
  );
}

class WorkoutRouteArgs {
  const WorkoutRouteArgs({this.key, required this.workout});

  final _i19.Key? key;

  final _i22.WorkoutModel workout;

  @override
  String toString() {
    return 'WorkoutRouteArgs{key: $key, workout: $workout}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WorkoutRouteArgs) return false;
    return key == other.key && workout == other.workout;
  }

  @override
  int get hashCode => key.hashCode ^ workout.hashCode;
}
