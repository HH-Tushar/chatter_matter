import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'padding.dart';

Widget customInput({
  required String hintText,
  String? initialValue,
  required bool isEnable,
  bool isBig = false,
  TextInputFormatter? formatter,
  required Function(String)? onChange,
}) {
  return TextFormField(
    enabled: isEnable,
    initialValue: initialValue,
    minLines: isBig ? 4 : null,
    maxLines: isBig ? 6 : null,
    inputFormatters: formatter != null ? [formatter] : null,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Color(0xffF8F8F8),
      border: OutlineInputBorder(
        borderSide: isBig == false ? BorderSide.none : BorderSide(),
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
    ),

    onChanged: onChange,
  );
}
