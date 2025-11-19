import 'package:chatter_matter_admin/common/custom_text_style.dart';
import 'package:flutter/material.dart';

import '../../common/app_bar.dart';
import '../../common/colors.dart';
import '../../common/padding.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customAppBar(
                title: "User Management",
                subTitle: "Add, edit, and manage users",
              ),
              vPad15,

              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Search here..",
                        fillColor: customWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),

                  Expanded(
                    child: DropdownButtonFormField(
                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Select Subscription",
                        fillColor: customWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        prefixIcon: Icon(Icons.filter_alt_outlined),
                      ),

                      borderRadius: BorderRadius.circular(12),

                      items: [
                        DropdownMenuItem(
                          value: "all",
                          child: Text("All Category"),
                        ),
                        DropdownMenuItem(
                          value: "all3",
                          child: Text("All Category"),
                        ),
                      ],
                      onChanged: (e) async {},
                    ),
                  ),

                  Expanded(
                    child: DropdownButtonFormField(
                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Select user status",
                        fillColor: customWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),

                      borderRadius: BorderRadius.circular(12),

                      items: [
                        DropdownMenuItem(
                          value: "active",
                          child: Text("Active"),
                        ),
                        DropdownMenuItem(
                          value: "deactivated",
                          child: Text("Deactivated"),
                        ),
                      ],
                      onChanged: (e) async {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("User", style: titleSmall()),
                ),
              ),
              Expanded(
                child: Text(
                  "Subscription",
                  style: titleSmall(),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  "Activity",
                  style: titleSmall(),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  "Status",
                  style: titleSmall(),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  "Actions",
                  style: titleSmall(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        vPad5,
        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 1200, maxHeight: 1000),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              itemCount: 100,
              itemBuilder: (context, index) => Card(
                color: customWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  side: BorderSide(color: primaryContainer),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text("User name"), Text("email")],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: customGrey,
                                borderRadius: BorderRadius.circular(
                                  defaultRadius,
                                ),
                              ),
                              child: Text("Free"),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("121 answers"),
                              Text(
                                "23 favorite",
                                style: bodySmall(color: customGrey),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: customGrey,
                                borderRadius: BorderRadius.circular(
                                  defaultRadius,
                                ),
                              ),
                              child: Text("active"),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Row(
                          spacing: 20,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              minWidth: 50,
                              height: 45,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              color: customLightOlive,
                              onPressed: () {},
                              child: Icon(Icons.edit),
                            ),
                            MaterialButton(
                              minWidth: 50,
                              height: 45,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              color: customLightOlive,
                              onPressed: () {},
                              child: Row(
                                spacing: 10,
                                children: [
                                  hPad5,
                                  Icon(Icons.visibility),
                                  Text(
                                    "View",
                                    style: bodyMedium(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  hPad5,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
