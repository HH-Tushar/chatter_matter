import 'package:chatter_matter_admin/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/colors.dart';
import '../../common/custom_button.dart';
import '../../common/custom_text_style.dart';
import '../../common/padding.dart';

import '../../env.dart';

part 'components/drawer.dart';

class LandingView extends StatelessWidget {
  final Widget child;
  const LandingView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // final LandingController controller = context.watch();
    final String currentPath = GoRouterState.of(context).matchedLocation;
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.centerRight,
            end: AlignmentGeometry.centerLeft,
            colors: [Color(0xffF3E8FF), Color(0xffFDF2F8), Color(0xffFFFFFF)],
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 240,
              height: double.infinity,
              color: openDrawerBg,
              padding: EdgeInsets.all(12),
              child: SafeArea(
                child: Column(
                  spacing: 10,
                  children: [
                    Column(
                      children: [
                        vPad10,
                        Text(appName, style: titleLarge()),
                        vPad5,
                        Text("Admin Dashboard", style: bodyMedium()),
                      ],
                    ),
                    vPad15,

                    drawerButton(
                      icon: "assets/icon/dashboard.svg",
                      isSelected: currentPath.contains(CustomRoute.home),
                      onTap: () => context.go(CustomRoute.home),
                      title: "Dashboard",
                    ),
                    drawerButton(
                      icon: "assets/icon/category.svg",
                      isSelected: currentPath.contains(CustomRoute.category),
                      onTap: () => context.go(CustomRoute.category),
                      title: "Category",
                    ),
                    drawerButton(
                      icon: "assets/icon/users.svg",
                      isSelected: currentPath.contains(CustomRoute.users),
                      onTap: () => context.go(CustomRoute.users),
                      title: "Users",
                    ),
                    drawerButton(
                      icon: "assets/icon/subscription.svg",
                      isSelected: currentPath.contains(
                        CustomRoute.subscription,
                      ),
                      onTap: () => context.go(CustomRoute.subscription),
                      title: "Subscription",
                    ),
                    drawerButton(
                      icon: "assets/icon/setting.svg",
                      isSelected: currentPath.contains(CustomRoute.setting),
                      onTap: () => context.go(CustomRoute.setting),
                      title: "Setting",
                    ),
                    drawerButton(
                      icon: "assets/icon/dashboard.svg",
                      isSelected: currentPath.contains(
                        CustomRoute.transactions,
                      ),
                      onTap: () => context.go(CustomRoute.transactions),
                      title: "Transactions",
                    ),
                    drawerButton(
                      icon: "assets/icon/dashboard.svg",
                      isSelected: currentPath.contains(
                        CustomRoute.deleteRequestView,
                      ),
                      onTap: () => context.go(CustomRoute.deleteRequestView),
                      title: "Delete Reqs",
                    ),
                    drawerButton(
                      isLogoutButton: true,
                      icon: "assets/icon/logout.svg",
                      isSelected: true,
                      onTap: () {},
                      title: "Logout",
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: defaultPadding,
                  right: defaultPadding,
                  top: defaultPadding,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
