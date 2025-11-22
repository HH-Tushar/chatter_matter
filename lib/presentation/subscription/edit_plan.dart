part of 'subscription_view.dart';

void showEditPlanDialog({
  required BuildContext context,
  // required List<SubscriptionPlan> plans,
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

      final SubscriptionProvider controller = context.watch();

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
              width: 600,
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
                            "Edit Subscription Plan",
                            style: titleLarge(color: customBlack),
                          ),
                          Text(
                            "update Plan for your users",
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

                  Text(
                    "Package Name",
                    style: titleSmall(fontWeight: FontWeight.w600),
                  ),
                  vPad10,

                  DropdownButtonFormField<SubscriptionPlan>(
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Select Plan",
                      fillColor: customWhite,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      prefixIcon: Icon(Icons.filter_alt_outlined),
                    ),

                    borderRadius: BorderRadius.circular(12),

                    items: controller.plans
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(item.title),
                          ),
                        )
                        .toList(),

                    onChanged: (e) async {},
                  ),

                  vPad15,

                  Text(
                    "Price Per month",
                    style: titleSmall(fontWeight: FontWeight.w600),
                  ),
                  vPad10,
                  customInput(
                    hintText: "",
                    isEnable: (!controller.isLoading && !controller.isUpdating),
                    onChange: (e) {},
                  ),
                  vPad15,
                  vPad15,

                  Text(
                    "Question",
                    style: titleSmall(fontWeight: FontWeight.w600),
                  ),
                  vPad10,
                  customInput(
                    hintText: "",
                    isEnable: (!controller.isLoading && !controller.isUpdating),
                    onChange: (e) {},
                  ),
                  vPad15,

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ...List.generate(
                        controller.plans.length,
                        (ind) => Container(
                          decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(defaultRadius)),
                          padding: EdgeInsets.all(defaultPadding),
                          child: Column(
                            children: [
                              Container(
                                height: 20,
                                width: 140,

                                decoration: BoxDecoration(color: primaryColor),
                              ),

                              Text(controller.plans[ind].title),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  vPad20,

                  Column(
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Add Features...",
                                filled: true,
                                fillColor: Color(0xffF8F8F8),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(
                                    defaultRadius,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          MaterialButton(
                            height: 56,
                            minWidth: 50,
                            elevation: 1,
                            color: Colors.red.shade100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),

                            onPressed: () {},

                            child: Center(child: Icon(Icons.add)),
                          ),
                        ],
                      ),
                    ],
                  ),

                  vPad20,

                  Row(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: customOutlineButton(
                          baseColor: customPurple,
                          isLoading:
                              (controller.isUpdating || controller.isUpdating),
                          onTap: () => Navigator.pop(context),
                          title: "Cancel",
                        ),
                      ),
                      Expanded(
                        child: customFilledButton(
                          bg: customPurple,
                          isLoading:
                              (controller.isUpdating || controller.isUpdating),
                          onTap: () => Navigator.pop(context),
                          title: "Add Category",
                        ),
                      ),
                    ],
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
