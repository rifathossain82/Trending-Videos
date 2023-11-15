import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trending_videos/src/features/chat/bloc/chat_bloc.dart';
import 'package:trending_videos/src/features/dashboard/cubits/dashboard_cubit.dart';
import 'package:trending_videos/src/features/home/bloc/home_bloc.dart';
import 'package:trending_videos/src/features/video_player/cubit/video_player_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///
  /// blocs
  sl.registerFactory(() => HomeBloc());
  sl.registerFactory(() => ChatBloc());

  /// cubits
  sl.registerFactory(() => VideoPlayerCubit());
  sl.registerFactory(() => DashboardCubit());

  ///
  /// Core


  ///
  /// External
  sl.registerLazySingleton(() => GlobalKey<ScaffoldMessengerState>());
  sl.registerLazySingleton(() => GlobalKey<NavigatorState>());
}
