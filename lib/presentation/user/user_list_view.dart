import 'package:chatter_matter_admin/common/custom_button.dart';
import 'package:chatter_matter_admin/common/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../application/model/user_model.dart';
import '../../common/app_bar.dart';
import '../../common/colors.dart';
import '../../common/padding.dart';
import '../../env.dart';
import '../../provider/user_provider.dart';

part 'user_row.dart';
part 'edit_user.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = context.watch();
    super.build(context);
    return userProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Column(
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
                            hintText: "search by email...",
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
                              value: SubscriptionType.all,
                              child: Text("All Category"),
                            ),
                            DropdownMenuItem(
                              value: SubscriptionType.free,
                              child: Text("Free User"),
                            ),
                            DropdownMenuItem(
                              value: SubscriptionType.standard,
                              child: Text("Standard User"),
                            ),
                            DropdownMenuItem(
                              value: SubscriptionType.vip,
                              child: Text("Vip User"),
                            ),
                          ],
                          onChanged: (e) async {
                            userProvider.toggleSubscriptionType(e);
                          },
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
                              value: true,
                              child: Text("Active"),
                            ),
                            DropdownMenuItem(
                              value: false,
                              child: Text("Deactivated"),
                            ),
                          ],
                          onChanged: (e) async {
                            userProvider.toggleActiveType(e);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              vPad15,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
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
                child: ListView.builder(
                  // padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  itemCount: userProvider.appUsers.length,
                  // itemCount: 0,
                  cacheExtent: 120,
                  //  itemExtent: 120,
                  itemBuilder: (context, index) => _UserRow(
                    onManage: () => showUserManagementDialog(context: context),
                    onView: () => showUserDetailsDialog(
                      context: context,
                      user: userProvider.appUsers[index],
                    ),
                    user: userProvider.appUsers[index],
                  ),
                ),
              ),
            ],
          );
  }
}
