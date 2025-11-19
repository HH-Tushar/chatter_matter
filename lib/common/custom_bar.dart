import 'package:chatter_matter_admin/common/custom_text_style.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'padding.dart';

Widget horizontalBar({
  required Color foregroundColor,
  required int value,
  required int totalUser,
  required String title,
  required List<Color> gradient,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    spacing: 8,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(title, style: bodyLarge()),
          Text(formatNumberWithComa(value), style: bodyLarge()),
        ],
      ),

      LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          final double foregroundCoverage = (width / totalUser) * value;

          return Stack(
            children: [
              //background
              Container(
                width: width,
                height: 15,
                decoration: BoxDecoration(
                  color: customGrey.withAlpha(50),
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),

              // foreground
              Container(
                width: foregroundCoverage,
                height: 15,
                decoration: BoxDecoration(
                  color: gradient.isEmpty ? foregroundColor : null,
                  gradient: gradient.isEmpty
                      ? null
                      : LinearGradient(colors: gradient),
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
            ],
          );
        },
      ),
    ],
  );
}


Widget verticalBar({
  required int totalUser,
  required int totalRevenue,

  required int totalValue,
  required String title,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [
      SizedBox(
        height: 475, // MUST give height
        width: 70,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double barHeight = 475 - 25;

            // Correct dynamic height
            final double foregroundHeight =
                (barHeight / totalValue) * totalRevenue;
            final double backgroundHeight =
                (barHeight / totalValue) * totalUser;

            return Stack(
              children: [
                // background (full bar)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: backgroundHeight,
                    decoration: BoxDecoration(
                      color: primaryContainer,
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                  ),
                ),

                // foreground (fill from bottom)
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: constraints.maxWidth,
                    height: foregroundHeight,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),

      SizedBox(height: 22, child: Text(title, style: titleSmall())),
    ],
  );
}
