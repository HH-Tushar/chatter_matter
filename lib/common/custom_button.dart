import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'colors.dart';
import 'custom_text_style.dart';

Widget drawerButton({
  required VoidCallback onTap,
  required String title,
  required String icon,
  required bool isSelected,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      maximumSize: Size(200, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      backgroundColor: isSelected ? primaryColor : openDrawerBg,
      elevation: isSelected ? 1 : 0,
    ),
    onPressed: onTap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          SvgPicture.asset(
            icon,
            color: isSelected ? customWhite : primaryColor,
          ),

          Text(
            title,
            style: titleSmall(color: isSelected ? customWhite : primaryColor),
          ),
        ],
      ),
    ),
  );
}
