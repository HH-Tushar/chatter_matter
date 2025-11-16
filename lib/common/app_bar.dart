import 'package:flutter/material.dart';

import 'colors.dart';
import 'custom_text_style.dart';

Widget customAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome Back", style: titleLarge()),
          Text(
            "It is time to menage your Credentials",
            style: titleSmall(color: customGrey),
          ),
        ],
      ),

      Container(
        padding: EdgeInsets.all(6),
        width: 245,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(),
        ),
        child: Row(
          spacing: 10,
          children: [
            CircleAvatar(radius: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name", style: titleMedium()),
                Text("email", style: bodyMedium()),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
