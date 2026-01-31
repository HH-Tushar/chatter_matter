import 'package:chatter_matter_admin/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app_bar.dart';
import '../../common/custom_button.dart';
import '../../common/custom_text_style.dart';
import '../../common/padding.dart';
import '../../core/formaters.dart';

import '../../provider/dashboard_provider.dart';

class DeleteRequestView extends StatelessWidget {
  const DeleteRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardProvider dashboardProvider = context.watch();
    return Column(
      children: [
        customAppBar(title: "Delete Requests", subTitle: ""),
        vPad35,
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Text("User", style: titleMedium())),

              Expanded(flex: 2, child: Text("Reason", style: titleMedium())),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Actions", style: titleMedium()),
                ),
              ),
            ],
          ),
        ),

        // vPad10,
        Divider(),
        vPad10,
        Expanded(
          child: dashboardProvider.isLoadingDelREq
              ? Center(child: CircularProgressIndicator())
              : (!dashboardProvider.isLoadingDelREq &&
                    dashboardProvider.deleteReqs.isEmpty)
              ? Column(
                  children: [
                    Text("No Data found"),
                    IconButton(
                      onPressed: () => dashboardProvider.restoreDelReq(),
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                )
              : RefreshIndicator(
                  onRefresh: () => dashboardProvider.restoreDelReq(),
                  child: ListView.builder(
                    itemCount: dashboardProvider.deleteReqs.length,
                    itemBuilder: (context, index) {
                      final item = dashboardProvider.deleteReqs[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide()),
                          // borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          spacing: 15,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SelectableText(item.userId),
                                  Row(
                                    children: [
                                      Text("UserId : "),
                                      SelectableText(item.userId),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Name : "),
                                      SelectableText(item.name ?? "N/A"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Email : "),
                                      SelectableText(item.email ?? "N/A"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Date : "),
                                      Text(formatDate(item.requestedAt)),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Expanded(flex: 2, child: Text(item.reason)),

                            Expanded(
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  customFilledButton(
                                    bg: customRed,
                                    isLoading: false,
                                    onTap: () {},
                                    title: "Delete Profile",
                                  ),
                                  customFilledButton(
                                    bg: customGreen,
                                    isLoading: false,
                                    onTap: () {},
                                    title: "Cancel Request",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
