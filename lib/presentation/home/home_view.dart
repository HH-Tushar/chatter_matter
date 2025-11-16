import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../common/colors.dart';
import '../../common/custom_bar.dart';
import '../../common/custom_text_style.dart';
import '../../common/padding.dart';

part 'components/top_tile.dart';
part 'components/quick_start_tile.dart';
part 'components/subscription_tile.dart';
part 'components/grow_chart.dart';
part 'controller.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
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

                        SizedBox(height: 500, child: UserGrowthChart()),

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
                );
  }
}