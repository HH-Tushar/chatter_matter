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

class HoverPopupBar extends StatefulWidget {
  final int totalUser;
  final int totalRevenue;
  final int totalValue;
  final String title;
  final String year;

  // How far above the widget the popup appears

  const HoverPopupBar({
    super.key,
    required this.totalUser,
    required this.totalRevenue,
    required this.totalValue,
    required this.title,
    required this.year,
  });

  @override
  State<HoverPopupBar> createState() => _HoverPopupState();
}

class _HoverPopupState extends State<HoverPopupBar> {
  bool isHover = false;

  double showAt = 0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
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
                        (barHeight / widget.totalValue) * widget.totalRevenue;
                    final double backgroundHeight =
                        (barHeight / widget.totalValue) * widget.totalUser;

                    if (showAt < foregroundHeight) {
                      showAt = foregroundHeight;
                    }
                    if (showAt < backgroundHeight) {
                      showAt = backgroundHeight;
                    }
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
                              borderRadius: BorderRadius.circular(
                                defaultRadius,
                              ),
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
                              borderRadius: BorderRadius.circular(
                                defaultRadius,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(
                height: 22,
                child: Text(widget.title, style: titleSmall()),
              ),
            ],
          ),

          /// Popup
          if (isHover)
            Positioned(
              // left: 0,
              // right: 35,
              bottom: (showAt < 300) ? showAt : 300 + 20,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  height: 115,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text("${widget.title} ${widget.year}"),

                      Row(
                        children: [
                          CircleAvatar(
                            radius: 2,
                            backgroundColor: primaryColor,
                          ),
                          Text("Total Revenue"),
                          Text(widget.totalRevenue.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
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
