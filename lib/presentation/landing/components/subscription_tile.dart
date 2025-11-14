part of '../landing_view.dart';

Widget subscriptionLayout() {
  return Container(
    height: 330,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(defaultRadius),
      color: primaryContainer.withAlpha(50),
    ),
    padding: const EdgeInsets.all(defaultPadding),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 25,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subscription Split", style: heading()),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: customGrey, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                spacing: 8,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 15,
                    color: customGrey,
                  ),
                  Text("Monthly", style: bodyLarge(color: customGrey)),
                ],
              ),
            ),
          ],
        ),

        horizontalBar(
          foregroundColor: customGrey.withAlpha(150),
          title: "Free Plan",
          totalUser: 2000,
          value: 150,
          gradient: [],
        ),
        horizontalBar(
          foregroundColor: primaryColor,
          title: "Standard Plan",
          totalUser: 2000,
          value: 150,
          gradient: [],
        ),
        horizontalBar(
          foregroundColor: primaryColor,
          title: "VIP Unlimited",
          totalUser: 2000,
          value: 1500,
          gradient: [primaryContainer, customYellow],
        ),
      ],
    ),
  );
}
