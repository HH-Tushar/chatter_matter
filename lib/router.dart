// 1. Define the Routes
import 'package:chatter_matter_admin/presentation/login.dart';
import 'package:chatter_matter_admin/presentation/setting/setting_view.dart';
import 'package:chatter_matter_admin/presentation/subscription/subscription_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'presentation/category/category_list_view.dart';
import 'presentation/home/home_view.dart';
import 'presentation/landing/landing_view.dart';
import 'presentation/question/question_list_view.dart';
import 'presentation/user/user_list_view.dart';
import 'provider/dashboard_provider.dart';

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
  initialLocation: '/home',

  redirect: (context, state) async{
    final token = await Provider.of<DashboardProvider>(context, listen: false).retrieveUser();

    // If user is not logged in and not already on /auth, redirect to /auth
    final loggingIn = state.uri.toString() == '/auth';
    if (token == false && !loggingIn) {
      return '/auth';
    }
    return null;
  },
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
          path: "question/:id",
          pageBuilder: (context, state) {
            final categoryId = state.pathParameters["id"];
            return NoTransitionPage(
              child: categoryId == null
                  ? Placeholder(child: Center(child: Text("No Data found")))
                  : QuestionListView(categoryId: categoryId),
            );
          },
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
