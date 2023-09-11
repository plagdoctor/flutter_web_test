import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_challenge/features/main_navigation/Main_navigation_screen.dart';
import 'package:tiktok_challenge/features/video/video_write_screen.dart';
import 'package:tiktok_challenge/house/home_screen.dart';
import 'package:tiktok_challenge/login/InterestsScreen.dart';
import 'package:tiktok_challenge/login/InterestsScreenPart2.dart';
import 'package:tiktok_challenge/login/LoginScreen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: InterestsScreen.routeName,
      path: InterestsScreen.routeURL,
      builder: (context, state) => const InterestsScreen(),
    ),
    GoRoute(
      name: InterestsScreenPart2.routeName,
      path: InterestsScreenPart2.routeURL,
      builder: (context, state) => const InterestsScreenPart2(),
    ),
    GoRoute(
      path: "/:tab(home|discover|inbox|profile)",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.params["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      path: VideoRecordingScreen.routeURL,
      name: VideoRecordingScreen.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 200),
        child: const VideoRecordingScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final position = Tween(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation);
          return SlideTransition(
            position: position,
            child: child,
          );
        },
      ),
    )
  ],
);
