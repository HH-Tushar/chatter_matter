import 'package:flutter/services.dart';

customDateFormatter(DateTime date) {
  return "${date.year}-${date.month + 1}-${date.day > 9 ? date.day : "0${date.day}"}";
}

final numberInputFilter = FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'));