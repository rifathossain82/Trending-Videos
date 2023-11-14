import 'package:flutter/material.dart';
import 'package:trending_videos/src/core/di/injection_container.dart';

class SnackBarService {
  static void showSnackBar({
    required String message,
    required Color bgColor,
    int durationInSeconds = 1,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: bgColor,
      duration: Duration(seconds: durationInSeconds),
      behavior: SnackBarBehavior.floating,
    );

    sl.get<GlobalKey<ScaffoldMessengerState>>().currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
