import 'package:chatter_matter_admin/presentation/home/home_view.dart';
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
import '../../env.dart';
import '../category/category_list_view.dart';
part 'components/drawer.dart';

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
                      isSelected: controller.selectedCategory == "",
                      onTap: () => controller.changeView("",0),
                      title: "Dashboard",
                    ),
                    drawerButton(
                      icon: "assets/icon/category.svg",
                      isSelected: controller.selectedCategory == "Category",
                      onTap: () => controller.changeView("Category",1),
                      title: "Category",
                    ),
                    drawerButton(
                      icon: "assets/icon/users.svg",
                      isSelected: controller.selectedCategory == "Users",
                      onTap: () => controller.changeView("Users",2),
                      title: "Users",
                    ),
                    drawerButton(
                      icon: "assets/icon/subscription.svg",
                      isSelected: controller.selectedCategory == "Subscription",
                      onTap: () => controller.changeView("Subscription",3),
                      title: "Subscription",
                    ),
                  ],
                ),
              ),
            ),

            Expanded(child: controller.children[controller.currentIndex]),
          ],
        ),
      ),
    );
  }
}
