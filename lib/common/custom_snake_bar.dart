import 'package:chatter_matter_admin/core/enums.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

showToast({
  required BuildContext context,
  required String title,
  required ToastType type,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: type == ToastType.success
          ? customGreen
          : type == ToastType.warning
          ? customYellow
          : customRed,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    ),
  );
}
