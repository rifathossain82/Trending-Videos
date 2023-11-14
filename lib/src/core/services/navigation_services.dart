import 'package:flutter/material.dart';
import 'package:trending_videos/src/core/di/injection_container.dart';

class NavigationService {
  static final NavigatorState? _navigatorState =
      sl.get<GlobalKey<NavigatorState>>().currentState;

  static void pop({dynamic result}) => _navigatorState?.pop(result);

  static Future? push(Widget nextPage) {
    return _navigatorState?.push(
      MaterialPageRoute(
        builder: (context) => nextPage,
      ),
    );
  }

  static Future? pushReplacement(Widget nextPage) {
    return _navigatorState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => nextPage,
      ),
    );
  }

  static Future? pushAndRemoveUntil(Widget nextPage) {
    return _navigatorState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => nextPage,
      ),
      (route) => false,
    );
  }
}
