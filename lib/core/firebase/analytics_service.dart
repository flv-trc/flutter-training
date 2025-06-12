import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver get analyticsObserver => FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> logEvent(String eventName, Map<String, Object> parameters) async {
    await _analytics.logEvent(name: eventName, parameters: parameters);
  }
}