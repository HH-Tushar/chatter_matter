part of 'category_list_view.dart';

void showAddCategoryDialog({required BuildContext context, Category? oldItem}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      String selectedColor = oldItem?.colorCode ?? '';
      String colorPalette = oldItem?.colorPalette ?? '';
      int favoritesCount = oldItem?.favoritesCount ?? 0;
      int questionCount = oldItem?.questionCount ?? 0;
      String id = oldItem?.id ?? "";
      String title = oldItem?.title ?? "";
      String subTitle = oldItem?.subTitle ?? "";

      return Dialog(
        child: StatefulBuilder(
          builder: (context, setState) {
            final CategoryProvider categoryProvider = context.watch();
            updateColor({required String val, required String cp}) {
              setState(() {
                selectedColor = val;
                colorPalette = cp;
              });
            }

            void addCategory() async {
              bool check;

              if (oldItem == null) {
                check = await categoryProvider.addCategory(
                  Category(
                    colorCode: selectedColor,
                    favoritesCount: favoritesCount,
                    id: id,
                    questionCount: questionCount,
                    title: title,
                    colorPalette: colorPalette,
                    subTitle: removeLineBreaks(subTitle),
                    createdAt: oldItem?.createdAt ?? DateTime.now(),
                    updatedAt: oldItem?.updatedAt ?? DateTime.now(),
                  ),
                );
              } else {
                check = await categoryProvider.updateCategory(
                  Category(
                    colorCode: selectedColor,
                    favoritesCount: favoritesCount,
                    id: id,
                    questionCount: questionCount,
                    title: title,
                    subTitle: removeLineBreaks(subTitle),
                    colorPalette: colorPalette,
                    createdAt: oldItem.createdAt ?? DateTime.now(),
                    updatedAt: oldItem.updatedAt ?? DateTime.now(),
                  ),
                );
              }

              if (check == true && context.mounted) {
                Navigator.pop(context);
              }
            }

            return Container(
              // height: 500,
              width: 580,
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
                            "${oldItem==null? "Add New":"Update"}  Category",
                            style: titleLarge(color: customBlack),
                          ),
                          Text(
                           "${oldItem==null? "Add New":"Update"}   Category for your users",
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
                    "Category",
                    style: titleSmall(fontWeight: FontWeight.w600),
                  ),
                  vPad10,
                  customInput(
                    hintText: "Category name..",
                    initialValue: title,
                    onChange: (e) => title = e,
                    isEnable: !categoryProvider.isAddingCategory,
                  ),

                  vPad15,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        "Category Color : ",
                        style: bodyMedium(
                          fontWeight: FontWeight.w600,
                          color: customGrey,
                        ),
                      ),

                      Expanded(
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            ...List.generate(
                              tileColors.length,
                              (ind) => InkWell(
                                onTap: () => updateColor(
                                  val: tileColors[ind].color.value.toString(),
                                  cp: tileColors[ind].colorName,
                                ),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: tileColors[ind].color,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        tileColors[ind].color.value
                                                .toString() ==
                                            selectedColor
                                        ? Border.all(
                                            width: 2,
                                            color: customBlack,
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  vPad20,

                  vPad20,

                  Text(
                    "Sub Title",
                    style: titleSmall(fontWeight: FontWeight.w600),
                  ),
                  vPad10,
                  customInput(
                    hintText: "sub title..",
                    initialValue: subTitle,
                    isBig: true,
                    onChange: (e) => subTitle = e,
                    isEnable: !categoryProvider.isAddingCategory,
                  ),

                  vPad15,

                  vPad20,

                  Row(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: customOutlineButton(
                          baseColor: customPurple,
                          isLoading: categoryProvider.isAddingCategory,
                          onTap: () => Navigator.pop(context),
                          title: "Cancel",
                        ),
                      ),
                      Expanded(
                        child: customFilledButton(
                          bg: customPurple,
                          isLoading: categoryProvider.isAddingCategory,
                          onTap: () => addCategory(),
                          title: "${oldItem==null? "Add":"Update"} Category",
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
