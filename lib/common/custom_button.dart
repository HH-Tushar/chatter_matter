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

Widget customOutlineButton({
  required bool isLoading,
  required VoidCallback onTap,
  required String title,
  Color? bg,
  Color? baseColor,
  IconData? icon,
}) {
  return MaterialButton(
    height: 50,
    minWidth: 150,
    elevation: 1,
    color: bg,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: baseColor ?? customPurple),
    ),

    onPressed: isLoading ? null : onTap,

    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          if (icon != null) Icon(icon, color: baseColor ?? customPurple),
          Text(title, style: titleSmall(color: baseColor ?? customPurple)),
        ],
      ),
    ),
  );
}

Widget customFilledButton({
  required bool isLoading,
  required VoidCallback onTap,
  required String title,
  required Color bg,
  Color? textColor,
}) {
  return MaterialButton(
    height: 50,
    minWidth: 150,
    elevation: 1,

    color: bg,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

    onPressed: isLoading ? null : onTap,

    child: Center(
      child: Text(title, style: titleSmall(color: textColor ?? customWhite)),
    ),
  );
}
