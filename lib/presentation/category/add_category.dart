part of 'category_list_view.dart';

void showAddCategoryDialog({required BuildContext context, Category? oldItem}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      String selectedColor = oldItem?.colorCode ?? '';
      int favoritesCount = oldItem?.favoritesCount ?? 0;
      int questionCount = oldItem?.questionCount ?? 0;
      String id = oldItem?.id ?? "";
      String title = oldItem?.title ?? "";

      return Dialog(
        child: StatefulBuilder(
          builder: (context, setState) {
            final CategoryProvider categoryProvider = context.watch();
            updateColor(String val) {
              setState(() {
                selectedColor = val;
              });
            }

            void addCategory() async {
              final check = await categoryProvider.updateCategory(
                Category(
                  colorCode: selectedColor,
                  favoritesCount: favoritesCount,
                  id: id,
                  questionCount: questionCount,
                  title: title,
                  createdAt: oldItem?.createdAt ?? DateTime.now(),
                  updatedAt: oldItem?.updatedAt ?? DateTime.now(),
                ),
              );
              if (check && context.mounted) {
                Navigator.pop(context);
              }
            }

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
                            "Add New Category",
                            style: titleLarge(color: customBlack),
                          ),
                          Text(
                            "Create a new Category for your users",
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
                                  tileColors[ind].value.toString(),
                                ),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: tileColors[ind],
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        tileColors[ind].value.toString() ==
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Question",
                        style: titleSmall(fontWeight: FontWeight.w600),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: customBlack,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        label: Text(
                          "Add",
                          style: bodyMedium(color: customWhite),
                        ),
                        icon: Icon(Icons.add, color: customWhite),
                      ),
                    ],
                  ),
                  vPad10,

                  Column(
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter your question",
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

                            child: Center(
                              child: Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  vPad20,

                  Row(
                    spacing: 5,
                    children: [
                      Checkbox(
                        activeColor: customBlack,
                        value: true,
                        onChanged: (e) {},
                      ),

                      Text(
                        "Age between 4-10 Years",
                        style: bodyMedium(
                          fontWeight: FontWeight.w500,
                          color: customBlack,
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
