import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'colors.dart';
import 'custom_text_style.dart';

Widget drawerButton({
  required VoidCallback onTap,
  required String title,
  required String icon,
  required bool isSelected,
  bool? isLogoutButton,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      maximumSize: Size(200, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      backgroundColor: isLogoutButton == true
          ? const Color(0xffFFE0E0)
          : isSelected
          ? primaryColor
          : openDrawerBg,
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
            color: isLogoutButton == true
                ? customRed
                : isSelected
                ? customWhite
                : primaryColor,
          ),

          Text(
            title,
            style: titleSmall(
              color: isLogoutButton == true
                  ? customRed
                  : isSelected
                  ? customWhite
                  : primaryColor,
            ),
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

// Widget customOutlineButton({
//   required bool isLoading,
//   required VoidCallback onTap,
//   required String title,
//   Color? bg,
//   Color? baseColor,
//   IconData? icon,
//   double? width,
// }) {
//   final Color borderColor = baseColor ?? customPurple;

//   return MouseRegion(
//     cursor: isLoading ? SystemMouseCursors.basic : SystemMouseCursors.click,
//     child: InkWell(
//       onTap: isLoading ? null : onTap,
//       borderRadius: BorderRadius.circular(8),
//       hoverColor: borderColor.withOpacity(0.05),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 150),
//         height: 50,
//         width: width ?? 150,

//         decoration: BoxDecoration(
//           color: bg ?? Colors.transparent,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: borderColor, width: 1),
//         ),
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             spacing: 6,
//             children: [
//               if (icon != null) Icon(icon, color: borderColor, size: 20),
//               Text(title, style: titleSmall(color: borderColor)),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }












// Widget customFilledButton({
//   required bool isLoading,
//   required VoidCallback onTap,
//   required String title,
//   required Color bg,
//   Color? textColor,
// }) {
//   return MouseRegion(
//     cursor: isLoading ? SystemMouseCursors.basic : SystemMouseCursors.click,
//     child: InkWell(
//       onTap: isLoading ? null : onTap,
//       borderRadius: BorderRadius.circular(8),
//       hoverColor: Colors.white.withOpacity(0.08),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 150),
//         height: 50,
//         width: 150,
//         decoration: BoxDecoration(
//           color: bg,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Center(
//           child: Text(
//             title,
//             style: titleSmall(color: textColor ?? customWhite),
//           ),
//         ),
//       ),
//     ),
//   );
// }
