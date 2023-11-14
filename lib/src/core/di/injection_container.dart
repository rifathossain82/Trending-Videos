import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///
  /// features start

  ///
  /// Core


  ///
  /// External
  sl.registerLazySingleton(() => GlobalKey<ScaffoldMessengerState>());
  sl.registerLazySingleton(() => GlobalKey<NavigatorState>());
}
