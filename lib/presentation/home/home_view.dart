import 'dart:math';

import 'package:chatter_matter_admin/env.dart';
import 'package:chatter_matter_admin/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../application/model/dashboard_stats.dart';
import '../../common/app_bar.dart';
import '../../common/colors.dart';
import '../../common/custom_bar.dart';
import '../../common/custom_text_style.dart';
import '../../common/padding.dart';
import '../../core/enums.dart';
import '../../core/formaters.dart';

part 'components/top_tile.dart';
part 'components/quick_start_tile.dart';
part 'components/subscription_tile.dart';
part 'components/grow_chart.dart';
part 'controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardProvider dashboardProvider = context.watch();
    final status = dashboardProvider.dashboardStatus;

    double currentMonthRev() {
      final now = DateTime.now();
      final currentMonth = shortMonthNames[now.month - 1]; // month is 1-based
      final currentMonthData = status?.barStacks.firstWhere(
        (b) => b.month == currentMonth,
        orElse: () =>
            BarStack(month: currentMonth, totalUsers: 0, totalRevenue: 0),
      );

      return currentMonthData?.totalRevenue ?? 0;
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customAppBar(
            title: "Welcome Back",
            subTitle: "It is time to menage your Credentials",
          ),

          ///top layer
          ///
          vPad10,
          LayoutBuilder(
            builder: (context, constraints) {
              // Available width of the whole area
              double maxWidth = constraints.maxWidth;

              // Decide tile width based on screen
              double tileWidth = (maxWidth > 1620)
                  ? 400 // large screens
                  : (maxWidth > 1500)
                  ? 350
                  : (maxWidth > 1200)
                  ? 300
                  : (maxWidth > 800)
                  ? 220 // medium screens
                  : 150; // small screens
              return Wrap(
                spacing: defaultPadding,
                runSpacing: defaultPadding,
                children: [
                  topTile(
                    title: "Total Users",
                    value: "${status?.totalUsers ?? 0}",
                    backgroundIcon: "assets/dashboard/questions_bg.svg",
                    foregroundIcon: "assets/dashboard/total_users.svg",
                    isPrimary: true,
                    tileWidth: tileWidth,
                  ),

                  topTile(
                    title: "Monthly Revenue",
                    value: "$currency ${currentMonthRev()}",
                    backgroundIcon: "assets/dashboard/revinue_bg.svg",
                    foregroundIcon: "assets/dashboard/revinue.svg",
                    isPrimary: false,
                    tileWidth: tileWidth,
                  ),
                  topTile(
                    title: "Total Question",
                    value: "${status?.totalQuestions ?? 0}",
                    backgroundIcon: "assets/dashboard/questions_bg.svg",
                    foregroundIcon: "assets/dashboard/question.svg",
                    isPrimary: false,
                    tileWidth: tileWidth,
                  ),
                  topTile(
                    title: "Subscription",
                    value:
                        "${(status?.totalVipUsers ?? 0) + (status?.totalStandardUsers ?? 0)}",
                    backgroundIcon: "assets/dashboard/subscription_bg.svg",
                    foregroundIcon: "assets/dashboard/subscription.svg",
                    isPrimary: false,
                    tileWidth: tileWidth,
                  ),
                ],
              );
            },
          ),
          vPad10,

          SizedBox(
            height: 500,
            child: UserGrowthChart(
              barStacks: dashboardProvider.dashboardStatus?.barStacks ?? [],
            ),
          ),

          vPad10,

          LayoutBuilder(
            builder: (context, constraints) {
              // Available width of the whole area
              double maxWidth = constraints.maxWidth;

              if (maxWidth > 800) {
                return Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: subscriptionLayout(
                        freeUser: status?.totalFreeUsers ?? 0,
                        standardUser: status?.totalStandardUsers ?? 0,
                        vipUser: status?.totalVipUsers ?? 0,
                      ),
                    ),
                    Expanded(
                      child: quickStartLayout(
                        favQuestions: status?.favCount ?? 0,
                        totalQuestion: status?.totalQuestions ?? 0,
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  spacing: 20,
                  children: [
                    subscriptionLayout(
                      freeUser: status?.totalFreeUsers ?? 0,
                      standardUser: status?.totalStandardUsers ?? 0,
                      vipUser: status?.totalVipUsers ?? 0,
                    ),
                    quickStartLayout(
                      favQuestions: status?.favCount ?? 0,
                      totalQuestion: status?.totalQuestions ?? 0,
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
