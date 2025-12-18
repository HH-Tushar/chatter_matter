import 'package:chatter_matter_admin/common/colors.dart';
import 'package:chatter_matter_admin/common/custom_button.dart';
import 'package:chatter_matter_admin/common/custom_text_style.dart';
import 'package:chatter_matter_admin/core/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../application/model/category_model.dart';
import '../../application/model/subscription_model.dart';
import '../../application/repo/subscription_repo.dart';
import '../../common/app_bar.dart';
import '../../common/custom_bar.dart';
import '../../common/custom_input.dart';
import '../../common/custom_snake_bar.dart';
import '../../common/padding.dart';
import '../../env.dart';
import '../../provider/category_provider.dart';
import '../../provider/subscription_provider.dart';
part 'edit_plan.dart';

class SubscriptionView extends StatelessWidget {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final SubscriptionProvider subscriptionProvider = context.watch();
    return Column(
      children: [
        customAppBar(
          title: "User Management",
          subTitle: "Add, edit, and manage users",
        ),
        vPad35,

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            customFilledButton(
              isLoading: false,
              onTap: () {
                showEditPlanDialog(context: context);
              },
              title: "Edit Package",
              bg: primaryColor,
            ),
          ],
        ),

        vPad20,
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    ...List.generate(
                      subscriptionProvider.plans.length,
                      (i) => _subscriptionTile(subscriptionProvider.plans[i]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

_subscriptionTile(SubscriptionPackageModel item) {
  return ConstrainedBox(
    constraints: BoxConstraints(minWidth: 370, maxWidth: 375, minHeight: 400),
    child: Container(
      decoration: BoxDecoration(
        color: customWhite,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.packageName, style: titleLarge(color: customBlack)),
                  Row(
                    children: [
                      Text(
                        "$currency ${item.pricePerMonth}",
                        style: heading(color: customBlack),
                      ),
                      Text("/month", style: bodyLarge(color: customGrey)),
                    ],
                  ),
                ],
              ),

              Container(
                // padding: EdgeInsets.all(defaultPadding),
                height: 48,
                width: 48,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: item.packageType == SubscriptionType.free.name
                      ? customLightGrey
                      : item.packageType == SubscriptionType.standard.name
                      ? primaryColor
                      : null,
                  boxShadow: customShadow,

                  gradient: item.packageType == SubscriptionType.vip.name
                      ? LinearGradient(colors: vipGradient)
                      : null,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/dashboard/subscription.svg",
                    color: customWhite,
                    height: 20,
                    width: 20,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),

          vPad20,
          vPad10,

          Column(
            spacing: 5,
            children: [
              ...List.generate(
                item.features.length,
                (i) => Row(
                  spacing: 10,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey.shade100,
                      child: Icon(Icons.check, color: customGrey, size: 15),
                    ),
                    Text(item.features[i], style: bodyLarge(color: customGrey)),
                  ],
                ),
              ),
            ],
          ),
          vPad20,
          Divider(),
          vPad20,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Active Users", style: bodyLarge(color: customGrey)),
              Text(item.activeUsers.toString(), style: titleSmall()),
            ],
          ),
          vPad10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("% of total Users", style: bodyLarge(color: customGrey)),
              Text("56.8 %", style: titleSmall()),
            ],
          ),

          vPad15,
          horizontalBar(
            foregroundColor: item.packageType == SubscriptionType.free.name
                ? customGrey
                : primaryColor,
            // title: "",
            value: item.activeUsers,
            totalUser: 1200,
            barHeight: 10,
            gradient: item.packageType == SubscriptionType.vip.name
                ? vipGradient
                : [],
          ),
        ],
      ),
    ),
  );
}
