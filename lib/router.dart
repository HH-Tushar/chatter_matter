// 1. Define the Routes
import 'package:chatter_matter_admin/presentation/login.dart';
import 'package:chatter_matter_admin/presentation/setting/setting_view.dart';
import 'package:chatter_matter_admin/presentation/subscription/subscription_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'presentation/category/category_list_view.dart';
import 'presentation/home/home_view.dart';
import 'presentation/landing/landing_view.dart';
import 'presentation/question/question_list_view.dart';
import 'presentation/user/user_list_view.dart';

class CustomRoute {
  static const String home = "/home";
  static const String category = "/category";
  static const String question = "/category/question";
  static const String users = "/users";
  static const String subscription = "/subscription";
  static const String setting = "/setting";
}

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/auth',

  // redirect: (context, state) {
  //   final user = FirebaseAuth.instance.currentUser;

  //   // If user is not logged in and not already on /auth, redirect to /auth
  //   final loggingIn = state.uri.toString() == '/auth';
  //   if (user == null && !loggingIn) {
  //     return '/auth';
  //   }
  //   return null;
  // },
  routes: [shellRoute, auth],
);

//

final shellRoute = ShellRoute(
  navigatorKey: _shellNavigatorKey,

  builder: (context, state, child) {
    return LandingView(child: child);
  },
  routes: [
    GoRoute(
      path: CustomRoute.home,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: HomeView()),
    ),
    GoRoute(
      path: CustomRoute.category,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: CategoryListView()),
      routes: <RouteBase>[
        GoRoute(
          path: "/question",
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: QuestionListView()),
        ),
      ],
    ),
    GoRoute(
      path: CustomRoute.users,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: UserListView()),
    ),
    GoRoute(
      path: CustomRoute.subscription,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SubscriptionView()),
    ),
    GoRoute(
      path: CustomRoute.setting,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SettingView()),
    ),
  ],
);

final auth = GoRoute(path: "/auth", builder: (context, state) => LoginView());
