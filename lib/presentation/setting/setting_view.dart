import 'package:chatter_matter_admin/common/custom_button.dart';
import 'package:chatter_matter_admin/common/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app_bar.dart';
import '../../common/colors.dart';
import '../../common/custom_text_style.dart';
import '../../common/padding.dart';
import '../../provider/dashboard_provider.dart';
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

  int currentIndex = 0;
  final List<Widget> children = [PersonalSpace(), PrivacyPolicy()];
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
          width: 350,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: customWhite,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // spacing: 10,
            children: [
              ElevatedButton(
                onPressed: currentIndex == 0
                    ? null
                    : () => setState(() {
                        currentIndex = 0;
                      }),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(150, 50),
                  disabledBackgroundColor: customWhite,
                  backgroundColor: Colors.grey.shade100,
                ),
                child: Text("Personal Space", style: titleSmall()),
              ),
              ElevatedButton(
                onPressed: currentIndex == 1
                    ? null
                    : () => setState(() {
                        currentIndex = 1;
                      }),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(150, 50),
                  disabledBackgroundColor: customWhite,
                  backgroundColor: Colors.grey.shade100,
                ),
                child: Text("Privacy Policy", style: titleSmall()),
              ),
            ],
          ),
        ),

        vPad20,

        Expanded(child: SingleChildScrollView(child: children[currentIndex])),
      ],
    );
  }
}
