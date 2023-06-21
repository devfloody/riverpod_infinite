import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_infinite/main.dart';
import 'package:riverpod_infinite/src/detail_page.dart';
import 'package:riverpod_infinite/src/post_model.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      GoRoute(
        path: '/detail',
        name: 'detail',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: DetailPage(post: state.extra as Post),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
});
