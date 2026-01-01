part of 'user_list_view.dart';

void showUserManagementDialog({
  required BuildContext context,
  required AppUser user,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      // String selectedColor = oldItem?.colorCode ?? '';
      // int favoritesCount = oldItem?.favoritesCount ?? 0;
      // int questionCount = oldItem?.questionCount ?? 0;
      // String id = oldItem?.id ?? "";
      // String title = oldItem?.title ?? "";

      return Dialog(
        child: StatefulBuilder(
          builder: (context, setState) {
            // final CategoryProvider categoryProvider = context.watch();
            // updateColor(String val) {
            //   setState(() {
            //     selectedColor = val;
            //   });
            // }

            // void addCategory() async {
            //   final check = await categoryProvider.updateCategory(
            //     Category(
            //       colorCode: selectedColor,
            //       favoritesCount: favoritesCount,
            //       id: id,
            //       questionCount: questionCount,
            //       title: title,
            //       createdAt: oldItem?.createdAt ?? DateTime.now(),
            //       updatedAt: oldItem?.updatedAt ?? DateTime.now(),
            //     ),
            //   );
            //   if (check && context.mounted) {
            //     Navigator.pop(context);
            //   }
            // }

            return Container(
              // height: 500,
              width: 500,
              padding: EdgeInsets.all(defaultPadding * 1.5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Manage User",
                            style: titleLarge(color: customBlack),
                          ),
                          Text(
                            "Update subscription plan or account status",
                            style: bodyLarge(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),

                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),

                  vPad20,

                  ///
                  ///
                  Row(
                    spacing: 10,
                    children: [
                      CircleAvatar(radius: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(user.name, style: bodyLarge()),
                          Text(user.email),
                        ],
                      ),
                    ],
                  ),

                  ///
                  ///
                  vPad15,

                  Text(
                    "Change Subscription Plan",
                    style: titleSmall(fontWeight: FontWeight.w600),
                  ),
                  vPad15,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Expanded(
                        child: customOutlineButton(
                          isLoading: false,
                          onTap: () {},
                          title: "Free",
                          bg:
                              user.subscriptionType ==
                                  SubscriptionType.free.name
                              ? primaryColor
                              : null,
                        ),
                      ),
                      Expanded(
                        child: customOutlineButton(
                          isLoading: false,
                          onTap: () {},
                          title: "Standard",

                          bg:
                              user.subscriptionType ==
                                  SubscriptionType.standard.name
                              ? primaryColor
                              : null,
                        ),
                      ),
                      Expanded(
                        child: customOutlineButton(
                          isLoading: false,
                          onTap: () {},
                          title: "Vip Ultimate",
                          bg: user.subscriptionType == SubscriptionType.vip.name
                              ? primaryColor
                              : null,
                        ),
                      ),
                    ],
                  ),
                  vPad20,

                  Text(
                    "Account Status",
                    style: titleSmall(fontWeight: FontWeight.w600),
                  ),
                  vPad15,

                  //  SizedBox()
                  customOutlineButton(
                    isLoading: false,
                    onTap: () {},
                    title: "Deactivate Account",
                    bg: Color(0xffFFE0E0),
                    baseColor: customRed,
                    icon: Icons.block,
                    // width: double.infinity,
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

void showUserDetailsDialog({
  required BuildContext context,
  required AppUser user,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          // height: 500,
          width: 500,
          padding: EdgeInsets.all(defaultPadding * 1.5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("User Details", style: titleLarge(color: customBlack)),

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),

              vPad20,

              ///
              ///
              ///
              ///
              Card(
                color: customWhite,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  side: BorderSide(color: primaryColor, width: 1),
                ),
                child: ListTile(
                  selected: true,

                  leading: CircleAvatar(radius: 24),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    child: Text(
                      user.subscriptionType,
                      style: bodyMedium(color: customWhite),
                    ),
                  ),
                ),
              ),

              ///
              ///
              vPad15,

              SizedBox(
                height: 80,
                child: Row(
                  spacing: 15,
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(defaultRadius),
                        ),
                        padding: EdgeInsets.all(defaultPadding),
                        child: Row(
                          spacing: 10,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  defaultRadius,
                                ),
                                color: primaryContainer,
                              ),

                              child: Icon(Icons.person),
                            ),

                            Column(
                              children: [
                                Text(
                                  "Status",
                                  style: bodyMedium(color: customGrey),
                                ),
                                Text(
                                  user.isActive ? "Active" : "Deactivated",
                                  style: titleSmall(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(defaultRadius),
                        ),
                        child: Row(
                          spacing: 10,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  defaultRadius,
                                ),
                                color: Colors.blue.shade100,
                              ),

                              child: Icon(
                                Icons.calendar_today_outlined,
                                color: customBlue,
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Joined",
                                  style: bodyMedium(color: customGrey),
                                ),
                                Text(
                                  user.journalCount.toString(),
                                  style: titleSmall(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              vPad20,
              Container(
                width: double.infinity,
                // height: 80,
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),

                child: Column(
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(defaultRadius),
                          ),
                          child: SvgPicture.asset(
                            "assets/common/message.svg",
                            color: customWhite,
                          ),
                        ),
                        Text("Activity Summery", style: titleSmall()),
                      ],
                    ),
                    vPad10,

                    Row(
                      spacing: 15,
                      children: [
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              color: customWhite,
                              borderRadius: BorderRadius.circular(
                                defaultRadius,
                              ),
                            ),
                            padding: EdgeInsets.all(defaultPadding),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/common/message.svg",
                                      color: primaryColor,
                                    ),

                                    Text("Journal", style: titleSmall()),
                                  ],
                                ),
                                Text(
                                  user.journalCount.toString(),
                                  style: bodyMedium(color: customGrey),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              color: customWhite,
                              borderRadius: BorderRadius.circular(
                                defaultRadius,
                              ),
                            ),
                            padding: EdgeInsets.all(defaultPadding),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/common/favorite.svg",
                                      color: customRed,
                                    ),

                                    Text("Favorites", style: titleSmall()),
                                  ],
                                ),
                                Text(
                                  user.favoriteCount.toString(),
                                  style: bodyMedium(color: customGrey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showSearchUserDetailsDialog({
  required BuildContext context,
  required AppUser user,
}) {
  bool isLoading = false;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: StatefulBuilder(
          builder: (context, setState) {
            void load() async {
              setState(() {
                isLoading = true;
              });

              user;
            }

            return Container(
              // height: 500,
              width: 500,
              padding: EdgeInsets.all(defaultPadding * 1.5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),

              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "User Details",
                              style: titleLarge(color: customBlack),
                            ),

                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close),
                            ),
                          ],
                        ),

                        vPad20,

                        ///
                        ///
                        ///
                        ///
                        Card(
                          color: customWhite,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            side: BorderSide(color: primaryColor, width: 1),
                          ),
                          child: ListTile(
                            selected: true,

                            leading: CircleAvatar(radius: 24),
                            title: Text(user.name),
                            subtitle: Text(user.email),
                            trailing: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(
                                  defaultRadius,
                                ),
                              ),
                              child: Text(
                                user.subscriptionType,
                                style: bodyMedium(color: customWhite),
                              ),
                            ),
                          ),
                        ),

                        ///
                        ///
                        vPad15,

                        SizedBox(
                          height: 80,
                          child: Row(
                            spacing: 15,
                            children: [
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      defaultRadius,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(defaultPadding),
                                  child: Row(
                                    spacing: 10,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            defaultRadius,
                                          ),
                                          color: primaryContainer,
                                        ),

                                        child: Icon(Icons.person),
                                      ),

                                      Column(
                                        children: [
                                          Text(
                                            "Status",
                                            style: bodyMedium(
                                              color: customGrey,
                                            ),
                                          ),
                                          Text(
                                            user.isActive
                                                ? "Active"
                                                : "Deactivated",
                                            style: titleSmall(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(defaultPadding),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      defaultRadius,
                                    ),
                                  ),
                                  child: Row(
                                    spacing: 10,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            defaultRadius,
                                          ),
                                          color: Colors.blue.shade100,
                                        ),

                                        child: Icon(
                                          Icons.calendar_today_outlined,
                                          color: customBlue,
                                        ),
                                      ),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Joined",
                                            style: bodyMedium(
                                              color: customGrey,
                                            ),
                                          ),
                                          Text(
                                            user.journalCount.toString(),
                                            style: titleSmall(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        vPad20,
                        Container(
                          width: double.infinity,
                          // height: 80,
                          padding: EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                            color: Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(defaultRadius),
                          ),

                          child: Column(
                            children: [
                              Row(
                                spacing: 10,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(
                                        defaultRadius,
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/common/message.svg",
                                      color: customWhite,
                                    ),
                                  ),
                                  Text("Activity Summery", style: titleSmall()),
                                ],
                              ),
                              vPad10,

                              Row(
                                spacing: 15,
                                children: [
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: customWhite,
                                        borderRadius: BorderRadius.circular(
                                          defaultRadius,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            spacing: 10,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/common/message.svg",
                                                color: primaryColor,
                                              ),

                                              Text(
                                                "Journal",
                                                style: titleSmall(),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            user.journalCount.toString(),
                                            style: bodyMedium(
                                              color: customGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: customWhite,
                                        borderRadius: BorderRadius.circular(
                                          defaultRadius,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            spacing: 10,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/common/favorite.svg",
                                                color: customRed,
                                              ),

                                              Text(
                                                "Favorites",
                                                style: titleSmall(),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            user.favoriteCount.toString(),
                                            style: bodyMedium(
                                              color: customGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        ///
                        ///actions
                        ///
                        vPad15,
                        Text(
                          "Change Subscription Plan",
                          style: titleSmall(fontWeight: FontWeight.w600),
                        ),
                        vPad15,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Expanded(
                              child: customOutlineButton(
                                isLoading: false,
                                onTap: () {},
                                title: "Free",
                                bg:
                                    user.subscriptionType ==
                                        SubscriptionType.free.name
                                    ? primaryColor
                                    : null,
                              ),
                            ),
                            Expanded(
                              child: customOutlineButton(
                                isLoading: false,
                                onTap: () {},
                                title: "Standard",

                                bg:
                                    user.subscriptionType ==
                                        SubscriptionType.standard.name
                                    ? primaryColor
                                    : null,
                              ),
                            ),
                            Expanded(
                              child: customOutlineButton(
                                isLoading: false,
                                onTap: () {},
                                title: "Vip Ultimate",
                                bg:
                                    user.subscriptionType ==
                                        SubscriptionType.vip.name
                                    ? primaryColor
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        vPad20,

                        Text(
                          "Account Action",
                          style: titleSmall(fontWeight: FontWeight.w600),
                        ),
                        vPad15,

                        //  SizedBox()
                        customOutlineButton(
                          isLoading: false,
                          onTap: () {},
                          title: "Deactivate Account",
                          bg: Color(0xffFFE0E0),
                          baseColor: customRed,
                          icon: Icons.block,
                          // width: double.infinity,
                        ),
                      ],
                    ),
            );
          },
        ),
      );
    },
  );
}
