import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/onboarding_screen.dart';
import '../screens/home_screen.dart';
import '../screens/gallery_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/success_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const OnboardingScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/gallery', builder: (context, state) => const GalleryScreen()),
    GoRoute(path: '/success', builder: (context, state) => const SuccessScreen()),
    GoRoute(
      path: '/detail/:id',
      pageBuilder: (context, state) {
        final id = state.pathParameters['id']!;
        return CustomTransitionPage(
          key: state.pageKey,
          child: DetailScreen(id: id),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: animation.drive(Tween(begin: const Offset(0, 0.2), end: Offset.zero).chain(CurveTween(curve: Curves.easeOut))),
                child: child,
              ),
            );
          },
        );
      },
    ),
  ],
);