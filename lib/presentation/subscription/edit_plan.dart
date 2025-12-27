part of 'subscription_view.dart';

void showEditPlanDialog({
  required BuildContext context,
  // required List<SubscriptionPlan> plans,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      SubscriptionPackageModel? selectedPlan;
      final featureController = TextEditingController();
      String featureEdit = "";
      String? selectedPlanPrice;
      String? selectedPlanPriceYear;
      String? selectedPlanQuestion;
      String? selectedPlanType;
      List<String> selectedPlanFeatures = [];
      List<String> selectedCategories = [];

      final SubscriptionProvider controller = context.watch();
      // final CategoryProvider categoryProvider = context.watch();

      final SubscriptionRepo subscriptionRepo = SubscriptionRepo();

      // final categoryMap = Map.fromEntries(
      //   categoryProvider.categoryList.map((c) => MapEntry(c.id, c)),
      // );

      return Dialog(
        child: StatefulBuilder(
          builder: (context, setState) {
            void update() async {
              if (selectedPlan == null) return;

              final (data, error) = await subscriptionRepo
                  .updateSubscriptionPlan(
                    SubscriptionPackageModel(
                      id: selectedPlan!.id,
                      packageName: selectedPlan!.packageName,
                      activeUsers: selectedPlan!.activeUsers,
                      pricePerMonth:
                          double.tryParse(selectedPlanPrice ?? "0") ??
                          selectedPlan?.pricePerMonth ??
                          0,
                      pricePerYear:
                          double.tryParse(selectedPlanPriceYear ?? "0") ??
                          selectedPlan?.pricePerYear ??
                          0,

                      questions: 0,
                      packageType: "",
                      categoryIds: selectedCategories,
                      features: selectedPlanFeatures,
                      createdAt: "",
                      updatedAt: "",
                    ),
                  );

              if (data != null) {
                Navigator.pop(context, true);
                showToast(
                  context: context,
                  title:
                      "Successfully updated the plan. Please refresh the page to see updates.",
                  type: ToastType.success,
                );
              } else {
                showToast(
                  context: context,
                  title: "Unable to updated the plan",
                  type: ToastType.failed,
                );
              }
            }

            void changePlan(SubscriptionPackageModel? val) async {
              if (val == null) return;

              setState(() {
                selectedPlan = val;
                selectedPlanPrice = val.pricePerMonth.toStringAsFixed(2);
                selectedPlanPriceYear = val.pricePerYear.toStringAsFixed(2);
                selectedPlanQuestion = val.questions < 1
                    ? "Unlimited"
                    : val.questions.toString();
                selectedPlanType = val.packageType;

                selectedPlanFeatures = val.features;
                selectedCategories = val.categoryIds;
              });
            }

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
                        onPressed: controller.isUpdating
                            ? null
                            : () {
                                featureController.dispose();
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

                  DropdownButtonFormField<SubscriptionPackageModel>(
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Select Plan",
                      fillColor: customWhite,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      // prefixIcon: Icon(Icons.filter_alt_outlined),
                    ),

                    borderRadius: BorderRadius.circular(12),

                    items: controller.plans
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(item.packageName),
                          ),
                        )
                        .toList(),

                    onChanged: (e) async {
                      changePlan(e);
                    },
                  ),

                  // vPad15,
                  // Text(
                  //   "Select Categories",
                  //   style: titleSmall(fontWeight: FontWeight.w600),
                  // ),
                  // vPad10,

                  // DropdownButtonFormField<Category>(
                  //   icon: Icon(Icons.keyboard_arrow_down_outlined),
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     hintText: "Select Category",
                  //     fillColor: customWhite,
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     // prefixIcon: Icon(Icons.filter_alt_outlined),
                  //   ),

                  //   borderRadius: BorderRadius.circular(12),

                  //   items: categoryProvider.categoryList
                  //       .map(
                  //         (item) => DropdownMenuItem(
                  //           value: item,
                  //           child: Text(item.title),
                  //         ),
                  //       )
                  //       .toList(),

                  //   onChanged: (e) async {
                  //     if (e != null && selectedPlan != null) {
                  //       setState(() => selectedCategories.add(e.id));
                  //     }
                  //   },
                  // ),

                  // vPad10,

                  // Wrap(
                  //   runSpacing: 8,
                  //   spacing: 8,

                  //   children: [
                  //     ...List.generate(
                  //       selectedCategories.length,
                  //       (index) => Container(
                  //         padding: EdgeInsets.only(left: 14),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(defaultRadius),
                  //           border: Border.all(),
                  //         ),
                  //         child: Row(
                  //           spacing: 8,
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [
                  //             Text(
                  //               categoryMap[selectedCategories[index]]?.title ??
                  //                   "Undefine",
                  //             ),

                  //             IconButton(
                  //               onPressed: () {
                  //                 setState(
                  //                   () => selectedCategories.remove(
                  //                     selectedCategories[index],
                  //                   ),
                  //                 );
                  //               },

                  //               icon: Icon(Icons.clear),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  vPad15,

                  Text(
                    "Price Per month",
                    style: titleSmall(fontWeight: FontWeight.w600),
                  ),
                  vPad10,
                  customInput(
                    hintText: selectedPlanPrice ?? "",
                    initialValue: selectedPlanPrice,
                    formatter: FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*\.?\d*$'),
                    ),
                    isEnable: (!controller.isLoading && !controller.isUpdating),
                    onChange: (e) => selectedPlanPrice = e,
                  ),
                  vPad15,

                  Text(
                    "Price Per Year",
                    style: titleSmall(fontWeight: FontWeight.w600),
                  ),
                  vPad10,
                  customInput(
                    hintText: selectedPlanPriceYear ?? "",
                    initialValue: selectedPlanPriceYear,
                    formatter: FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*\.?\d*$'),
                    ),
                    isEnable: (!controller.isLoading && !controller.isUpdating),
                    onChange: (e) => selectedPlanPriceYear = e,
                  ),
                  vPad15,
                  vPad15,

                  Text(
                    "Question per day",
                    style: titleSmall(fontWeight: FontWeight.w600),
                  ),
                  vPad10,
                  customInput(
                    hintText: selectedPlanQuestion ?? "",
                    initialValue: selectedPlanQuestion,

                    formatter: FilteringTextInputFormatter.digitsOnly,
                    // isEnable: (!controller.isLoading && !controller.isUpdating),
                    isEnable: false,
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
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color:
                                  controller.plans[ind].packageType ==
                                      selectedPlanType
                                  ? primaryContainer
                                  : customLightGrey,
                            ),
                            color: customWhite,
                            borderRadius: BorderRadius.circular(defaultRadius),
                            boxShadow:
                                controller.plans[ind].packageType ==
                                    selectedPlanType
                                ? customShadow
                                : null,
                          ),
                          padding: EdgeInsets.all(defaultPadding),
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                width: 140,

                                decoration: BoxDecoration(
                                  color:
                                      controller.plans[ind].packageType ==
                                          SubscriptionType.free.name
                                      ? customGrey
                                      : controller.plans[ind].packageType ==
                                            SubscriptionType.standard.name
                                      ? primaryColor
                                      : null,
                                  borderRadius: BorderRadius.circular(
                                    defaultRadius,
                                  ),
                                  gradient:
                                      controller.plans[ind].packageType ==
                                          SubscriptionType.vip.name
                                      ? LinearGradient(colors: vipGradient)
                                      : null,
                                ),
                              ),

                              Text(controller.plans[ind].packageName),
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
                              controller: featureController,
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
                              // onChanged: (value) => featureEdit = value,
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

                            onPressed: () {
                              selectedPlanFeatures.add(
                                featureController.text.trim(),
                              );
                              setState(() {
                                featureController.text = "";
                              });
                            },

                            child: Center(child: Icon(Icons.add)),
                          ),
                        ],
                      ),

                      ...List.generate(
                        selectedPlanFeatures.length,
                        (i) => ListTile(
                          title: Text(selectedPlanFeatures[i]),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                selectedPlanFeatures.remove(
                                  selectedPlanFeatures[i],
                                );
                              });
                            },
                            icon: Icon(Icons.close),
                          ),
                        ),
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
                          onTap: () {
                            featureController.dispose();
                            Navigator.pop(context);
                          },
                          title: "Cancel",
                        ),
                      ),
                      Expanded(
                        child: customFilledButton(
                          bg: customPurple,
                          isLoading:
                              (controller.isUpdating || controller.isUpdating),
                          onTap: () => update(),
                          title: "Update Plan",
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
