part of 'subscription_view.dart';

void showEditPlanDialog({
  required BuildContext context,
  // required List<SubscriptionPlan> plans,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      SubscriptionPlan? selectedPlan;
      String? selectedPlanPrice;
      String? selectedPlanQuestion;
      String? selectedPlanType;
      List<String> selectedPlanFeatures = [];

      final SubscriptionProvider controller = context.watch();

      return Dialog(
        child: StatefulBuilder(
          builder: (context, setState) {
            void update() async {}
            void changePlan(SubscriptionPlan? val) async {
              if (val == null) return;

              setState(() {
                selectedPlan = val;
                selectedPlanPrice = val.pricePerMonth.toStringAsFixed(2);
                selectedPlanQuestion = val.questionLimitPerDay < 1
                    ? "Unlimited"
                    : val.questionLimitPerDay.toString();
                selectedPlanType = val.type;
                selectedPlanFeatures = val.features;
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
                      // prefixIcon: Icon(Icons.filter_alt_outlined),
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

                    onChanged: (e) async {
                      changePlan(e);
                    },
                  ),

                  vPad15,

                  Text(
                    "Price Per month",
                    style: titleSmall(fontWeight: FontWeight.w600),
                  ),
                  vPad10,
                  customInput(
                    hintText: selectedPlanPrice ?? "",
                    initialValue: selectedPlanPrice,
                    formatter: FilteringTextInputFormatter.digitsOnly,
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
                                  controller.plans[ind].type == selectedPlanType
                                  ? primaryContainer
                                  : customLightGrey,
                            ),
                            color: customWhite,
                            borderRadius: BorderRadius.circular(defaultRadius),
                            boxShadow:
                                controller.plans[ind].type == selectedPlanType
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
                                      controller.plans[ind].type ==
                                          SubscriptionType.free.name
                                      ? customGrey
                                      : controller.plans[ind].type ==
                                            SubscriptionType.standard.name
                                      ? primaryColor
                                      : null,
                                  borderRadius: BorderRadius.circular(
                                    defaultRadius,
                                  ),
                                  gradient:
                                      controller.plans[ind].type ==
                                          SubscriptionType.vip.name
                                      ? LinearGradient(colors: vipGradient)
                                      : null,
                                ),
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

                      ...List.generate(
                        selectedPlanFeatures.length,
                        (i) => ListTile(
                          title: Text(selectedPlanFeatures[i]),
                          trailing: IconButton(
                            onPressed: () {},
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
