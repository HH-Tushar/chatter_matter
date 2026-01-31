// 1. Define the Routes
import 'package:chatter_matter_admin/presentation/login.dart';
import 'package:chatter_matter_admin/presentation/setting/setting_view.dart';
import 'package:chatter_matter_admin/presentation/subscription/subscription_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'presentation/category/category_list_view.dart';
import 'presentation/delete_request/delete_request_view.dart';
import 'presentation/home/home_view.dart';
import 'presentation/landing/landing_view.dart';
import 'presentation/question/question_list_view.dart';
import 'presentation/transaction/transaction_list_view.dart';
import 'presentation/user/user_list_view.dart';
import 'provider/dashboard_provider.dart';
import 'public/delete_user_public.dart';
import 'public/payment_failed.dart';
import 'public/payment_sucess.dart';
import 'public/privacy_policy.dart';

class CustomRoute {
  static const String home = "/home";
  static const String category = "/category";
  static const String question = "/category/question";
  static const String users = "/users";
  static const String subscription = "/subscription";
  static const String setting = "/setting";
  static const String transactions = "/transactions";
  static const String deleteRequestView = "/deleteRequestView";
  static const String privacyPolicy = "/privacy-policy";
  static const String deleteAccountPage = "/deleteAccountPage";
  static const String paymentSuccess = "/paymentSuccess";
  static const String paymentFailed = "/paymentFailed";
}

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/home',

  redirect: (context, state) async {
    final token = await Provider.of<DashboardProvider>(
      context,
      listen: false,
    ).retrieveUser();

    // If user is not logged in and not already on /auth, redirect to /auth
    final location = state.uri.path;

    // ✅ ALLOW PUBLIC ROUTES
    final publicRoutes = [
      '/auth',
      CustomRoute.privacyPolicy,
      CustomRoute.deleteAccountPage,
      CustomRoute.paymentFailed,
      CustomRoute.paymentSuccess,
    ];

    // final loggingIn = state.uri.toString() == '/auth';
    if (publicRoutes.contains(location)) {
      return null;
    }

    if (token == false) {
      return '/auth';
    }
    return null;
  },
  routes: [
    shellRoute,
    auth,
    GoRoute(
      path: CustomRoute.privacyPolicy,
      builder: (context, state) => const PrivacyTermsView(),
    ),
    GoRoute(
      path: CustomRoute.deleteAccountPage,
      builder: (context, state) => const DeleteAccountPage(),
    ),
    GoRoute(
      path: CustomRoute.paymentFailed,
      builder: (context, state) => const PaymentFailed(),
    ),
    GoRoute(
      path: CustomRoute.paymentSuccess,
      builder: (context, state) => const PaymentSuccess(),
    ),
  ],
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
            final category = state.pathParameters["id"];
            final categoryId = category?.split("-")[0];
            final categoryName = category?.split("-")[1];

            return NoTransitionPage(
              child: categoryId == null || categoryName == null
                  ? Placeholder(child: Center(child: Text("No Data found")))
                  : QuestionListView(
                      categoryId: categoryId,
                      categoryName: categoryName,
                    ),
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
      path: CustomRoute.transactions,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: TransactionListView()),
    ),

    GoRoute(
      path: CustomRoute.deleteRequestView,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: DeleteRequestView()),
    ),

    GoRoute(
      path: CustomRoute.setting,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SettingView()),
    ),
  ],
);

final auth = GoRoute(path: "/auth", builder: (context, state) => LoginView());
