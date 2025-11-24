import 'package:chatter_matter_admin/common/custom_button.dart';
import 'package:chatter_matter_admin/common/custom_input.dart';
import 'package:flutter/material.dart';

import '../../common/app_bar.dart';
import '../../common/colors.dart';
import '../../common/custom_text_style.dart';
import '../../common/padding.dart';
part 'personal_space.dart';
part 'privacy_policy.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool isBaby = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customAppBar(title: "Setting", subTitle: "Add, edit, and manage users"),
        vPad35,
        Container(
          height: 60,
          width: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: customWhite,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            // spacing: 10,
            children: [
              ElevatedButton(
                onPressed: isBaby
                    ? null
                    : () => setState(() {
                        isBaby = true;
                      }),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(150, 50),
                  disabledBackgroundColor: customWhite,
                  backgroundColor: Colors.grey.shade100,
                ),
                child: Text("4-10 Years", style: titleSmall()),
              ),
              ElevatedButton(
                onPressed: !isBaby
                    ? null
                    : () => setState(() {
                        isBaby = false;
                      }),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(150, 50),
                  disabledBackgroundColor: customWhite,
                  backgroundColor: Colors.grey.shade100,
                ),
                child: Text("10+ Years", style: titleSmall()),
              ),
            ],
          ),
        ),

        vPad20,

        PersonalSpace(),
      ],
    );
  }
}
