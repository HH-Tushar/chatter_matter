import 'package:chatter_matter_admin/common/custom_text_style.dart';
import 'package:chatter_matter_admin/env.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app_bar.dart';
import '../../common/padding.dart';
import '../../core/formaters.dart';
import '../../provider/dashboard_provider.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardProvider dashboardProvider = context.watch();
    return Column(
      children: [
        customAppBar(title: "Transaction Management", subTitle: ""),
        vPad35,
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Text("UserId", style: titleSmall())),
              Expanded(
                child: Text(
                  "Package Info",
                  textAlign: TextAlign.left,
                  style: titleSmall(),
                ),
              ),
              Expanded(child: Text("Amount/Status", style: titleSmall())),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Stripe Data", style: titleSmall()),
                ),
              ),
            ],
          ),
        ),

        // vPad10,
        Divider(),
        vPad10,
        Expanded(
          child: dashboardProvider.isLoadingTransaction
              ? Center(child: CircularProgressIndicator())
              : (!dashboardProvider.isLoadingTransaction &&
                    dashboardProvider.transactionList.isEmpty)
              ? Column(
                  children: [
                    Text("No Data found"),
                    IconButton(
                      onPressed: () => dashboardProvider.restoreTransaction(),
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                )
              : RefreshIndicator(
                  onRefresh: () => dashboardProvider.restoreTransaction(),
                  child: ListView.builder(
                    itemCount: dashboardProvider.transactionList.length,
                    itemBuilder: (context, index) {
                      final item = dashboardProvider.transactionList[index];
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
                                  SelectableText(item.userId),
                                  Row(
                                    children: [
                                      Text("Date : "),
                                      Text(formatDate(item.createdAt)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Plan Id :"),
                                      SelectableText(item.planId),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Duration : "),
                                      Text("${item.packageDuration} month"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Amount : "),
                                      Text(
                                        (item.amountTotal / 100).toString() +
                                            currency,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Status: "),
                                      Text(item.status),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Session : "),
                                      SelectableText(
                                        item.stripeCheckoutSessionId,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Trans. Id :"),
                                      SelectableText(item.id ?? ""),
                                    ],
                                  ),
                                  // Text(item.stripeEventId),
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
