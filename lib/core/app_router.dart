import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/success_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/detail/:id',
      pageBuilder: (context, state) {
        final id = state.pathParameters['id']!;
        return CustomTransitionPage(
          key: state.pageKey,
          child: DetailScreen(id: id),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Task 3B: Custom Slide-up + Fade
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: animation.drive(
                  Tween(begin: const Offset(0, 1), end: Offset.zero)
                      .chain(CurveTween(curve: Curves.easeOut)),
                ),
                child: child,
              ),
            );
          },
        );
      },
    ),
    GoRoute(path: '/success', builder: (context, state) => const SuccessScreen()),
  ],
);