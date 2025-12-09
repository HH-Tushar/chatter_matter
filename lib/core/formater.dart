import 'package:flutter/services.dart';

dateFormatter(DateTime date) {
  return "${date.year}-${date.month}-${date.day}";
}

class CommonValidator {
  static String? fieldRequired(String? val) {
    if (val == null || val.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  static String? passwordRequired(String? val) {
    if (val == null || val.isEmpty) {
      return "Password is required";
    }
    if (val.length < 6) {
      return "Minimum password length is 6.";
    }
    return null;
  }

  static String? confirmPasswordRequired({
    required String password,
    required String? val,
  }) {
    if (val == null || val.isEmpty) {
      return "Password is required";
    }
    if (val.length < 6) {
      return "Minimum password length is 6.";
    }
    if (val != password) {
      return "Confirm Password do not match.";
    }
    return null;
  }

  static String? emailValidator(String? val) {
    if (val == null || val.isEmpty) {
      return "Email is required";
    }

    // Basic email pattern
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(val)) {
      return "Enter a valid email address";
    }

    return null;
  }

  static String? positiveNumberRequired(String? val) {
    if (val == null) {
      return "This field is required";
    }

    double? data = double.tryParse(val);
    if (data == null) {
      return "please enter valid number";
    }
    if (data < 1) {
      return "Number must be greater than 1";
    }
    return null;
  }
}

final numberInputFilter = FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'));





String timeAgo(DateTime dateTime) {
  final now = DateTime.now();
  final diff = now.difference(dateTime);

  if (diff.inSeconds < 60) {
    return "now";
  } else if (diff.inMinutes < 60) {
    return "${diff.inMinutes}m ago";
  } else if (diff.inHours < 24) {
    return "${diff.inHours}h ago";
  } else if (diff.inDays < 7) {
    return "${diff.inDays}d ago";
  } else if (diff.inDays < 30) {
    final weeks = diff.inDays ~/ 7;
    return "${weeks}w ago";
  } else if (diff.inDays < 365) {
    final months = diff.inDays ~/ 30;
    return "${months}mo ago";
  } else {
    final years = diff.inDays ~/ 365;
    return "${years}y ago";
  }
}
