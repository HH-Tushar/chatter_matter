import 'package:flutter/material.dart';

import 'padding.dart';

Widget customInput({
  required String hintText,
  String ? initialValue,
  required bool isEnable,
  required Function(String)? onChange,
}) {
  return TextFormField(
    enabled: isEnable,
    initialValue: initialValue,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Color(0xffF8F8F8),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
    ),

    onChanged: onChange,
  );
}
