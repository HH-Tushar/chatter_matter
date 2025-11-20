import 'package:flutter/material.dart';

import 'colors.dart';
import 'custom_text_style.dart';

Widget customAppBar({required String title, required String subTitle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleLarge()),
          Text(subTitle, style: titleSmall(color: customGrey)),
        ],
      ),

      Container(
        padding: EdgeInsets.all(6),
        width: 245,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(),
        ),
        child: Row(
          spacing: 10,
          children: [
            CircleAvatar(radius: 25, child: Icon(Icons.person)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Admin", style: titleMedium()),
                Text("email@gmail.com", style: bodyMedium()),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
