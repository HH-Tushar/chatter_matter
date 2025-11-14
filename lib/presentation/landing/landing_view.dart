import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_bar.dart';
import '../../common/custom_button.dart';
import '../../common/custom_text_style.dart';
import '../../common/padding.dart';
import '../../common/testComponent.dart';
part 'components/drawer.dart';
part 'components/top_tile.dart';
part 'components/quick_start_tile.dart';
part 'components/subscription_tile.dart';
part 'controller.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    final LandingController controller = context.watch();
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
                    drawerButton(
                      icon: "assets/icon/dashboard.svg",
                      isSelected: controller.selectedCategory == "",
                      onTap: () => controller.changeView(""),
                      title: "Dashboard",
                    ),
                    drawerButton(
                      icon: "assets/icon/category.svg",
                      isSelected: controller.selectedCategory == "Category",
                      onTap: () => controller.changeView("Category"),
                      title: "Category",
                    ),
                    drawerButton(
                      icon: "assets/icon/users.svg",
                      isSelected: controller.selectedCategory == "Users",
                      onTap: () => controller.changeView("Users"),
                      title: "Users",
                    ),
                    drawerButton(
                      icon: "assets/icon/subscription.svg",
                      isSelected: controller.selectedCategory == "Subscription",
                      onTap: () => controller.changeView("Subscription"),
                      title: "Subscription",
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome Back", style: titleLarge()),
                        Text(
                          "It is time to menage your Credentials",
                          style: titleSmall(color: customGrey),
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
                            print(maxWidth);
                            return Wrap(
                              spacing: defaultPadding,
                              runSpacing: defaultPadding,
                              children: [
                                topTile(
                                  title: "Total Users",
                                  value: "50,000",
                                  backgroundIcon:
                                      "assets/dashboard/questions_bg.svg",
                                  foregroundIcon:
                                      "assets/dashboard/total_users.svg",
                                  isPrimary: true,
                                  tileWidth: tileWidth,
                                ),

                                topTile(
                                  title: "Monthly Revenue",
                                  value: "50,000",
                                  backgroundIcon:
                                      "assets/dashboard/revinue_bg.svg",
                                  foregroundIcon:
                                      "assets/dashboard/revinue.svg",
                                  isPrimary: false,
                                  tileWidth: tileWidth,
                                ),
                                topTile(
                                  title: "Total Question",
                                  value: "50,000",
                                  backgroundIcon:
                                      "assets/dashboard/questions_bg.svg",
                                  foregroundIcon:
                                      "assets/dashboard/question.svg",
                                  isPrimary: false,
                                  tileWidth: tileWidth,
                                ),
                                topTile(
                                  title: "Subscription",
                                  value: "50,000",
                                  backgroundIcon:
                                      "assets/dashboard/subscription_bg.svg",
                                  foregroundIcon:
                                      "assets/dashboard/subscription.svg",
                                  isPrimary: false,
                                  tileWidth: tileWidth,
                                ),
                              ],
                            );
                          },
                        ),
                        vPad10,
                        Container(
                          height: 500,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            color: primaryContainer.withAlpha(50),
                          ),
                          padding: EdgeInsets.all(defaultPadding),

                          child: Stack(
                            children: [
                              //mask
                              Positioned.fill(
                                bottom: 12,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(5, (ind) {
                                      int label = 5 - ind - 1;
                                      return Row(
                                        spacing: 10,
                                        children: [
                                          Text(
                                            "${label * 10}k",
                                            style: titleSmall(
                                              color: customGrey,
                                            ),
                                          ),
                                          Expanded(
                                            child: DottedLine(
                                              dashColor: customGrey.withAlpha(
                                                80,
                                              ),
                                              dashRadius: 5,
                                              dashGapLength: 6,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ],
                                ),
                              ),

                              Positioned(
                                bottom: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Row(
                                    children: [
                                      HoverPopup(
                                        popup: Text("data"),
                                        child: verticalBar(
                                          totalRevenue: 70,
                                          totalUser: 500,
                                          totalValue: 500,
                                          title: "Jan",
                                        ),
                                      ),

                                      HoverPopupBar(
                                        title: "Feb",
                                        totalRevenue: 100,
                                        totalUser: 520,
                                        totalValue: 1800,
                                        year: "2025",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                                  Expanded(child: subscriptionLayout()),
                                  Expanded(child: quickStartLayout()),
                                ],
                              );
                            } else {
                              return Column(
                                spacing: 20,
                                children: [
                                  subscriptionLayout(),
                                  quickStartLayout(),
                                ],
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
