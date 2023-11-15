import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_videos/src/core/di/injection_container.dart';
import 'package:trending_videos/src/core/services/agora_chat_services.dart';
import 'package:trending_videos/src/core/theme/app_theme.dart';
import 'package:trending_videos/src/core/utils/app_constants.dart';
import 'package:trending_videos/src/core/widgets/k_scroll_behavior.dart';
import 'package:trending_videos/src/features/chat/bloc/chat_bloc.dart';
import 'package:trending_videos/src/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:trending_videos/src/features/dashboard/view/pages/dashboard_page.dart';
import 'package:trending_videos/src/features/home/bloc/home_bloc.dart';
import 'package:trending_videos/src/features/video_player/cubit/video_player_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  /// Initialize injection container.
  await init();

  /// Initialize Agora Chat Service.
  AgoraChatService.initSDK();

  /// Set dark status bar for whole project.
  AppTheme.setDarkStatusBar();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<DashboardBloc>()),
        BlocProvider(create: (context) => sl<HomeBloc>()),
        BlocProvider(create: (context) => sl<VideoPlayerCubit>()),
        BlocProvider(create: (context) => sl<ChatBloc>()),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: KScrollBehavior(),
            child: child!,
          );
        },
        navigatorKey: sl.get<GlobalKey<NavigatorState>>(),
        scaffoldMessengerKey: sl.get<GlobalKey<ScaffoldMessengerState>>(),
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: AppTheme.lightTheme,
        home: const DashboardPage(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
