import 'package:chatter_matter_admin/common/colors.dart';
import 'package:chatter_matter_admin/common/custom_button.dart';
import 'package:chatter_matter_admin/common/padding.dart';
import 'package:flutter/material.dart';

Future<bool?> showDeleteDialogue({
  required BuildContext context,
  required String content,
  required String title,
}) async{
  await showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // VERY IMPORTANT
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              vPad10,

              Text(content, style: TextStyle(fontSize: 15)),

              vPad20,

              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    MainAxisAlignment.center, // Align horizontally
                children: [
                  customFilledButton(
                    isLoading: false,
                    onTap: () {
                      Navigator.pop(context,false);
                    },
                    title: "No, Cancel",
                    bg: primaryContainer,
                  ),
                  SizedBox(width: 10),
                  customOutlineButton(
                    isLoading: false,
                    onTap: () { Navigator.pop(context,true);},
                    title: "Yes, Delete",
                    bg: primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
  return null;
}
