part of 'question_list_view.dart';

void showAddQuestionDialog({required BuildContext context}) {
  List<String> questions = [];

  showDialog(
    context: context,
    barrierDismissible: false,
    fullscreenDialog: false,
    useSafeArea: true,
    builder: (BuildContext context) {
      bool isBaby = false;

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
              height: 700,
              width: 550,
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
                            "Add New Question",
                            style: titleLarge(color: customBlack),
                          ),
                          Text(
                            "Create questions for 'Category name'",
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
                        onPressed: () {
                          setState(() => questions.add(""));
                        },
                        label: Text(
                          "Add",
                          style: bodyMedium(color: customWhite),
                        ),
                        icon: Icon(Icons.add, color: customWhite),
                      ),
                    ],
                  ),
                  vPad10,

                  Expanded(
                    child: ListView.builder(
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
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

                                  onChanged: (value) =>
                                      questions[index] = value,
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
                                  setState(() => questions.removeAt(index));
                                },

                                child: Center(
                                  child: Icon(Icons.delete, color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // vPad20,
                  Row(
                    spacing: 5,
                    children: [
                      Checkbox(
                        activeColor: customBlack,
                        value: isBaby,
                        onChanged: (e) {
                          setState(() => isBaby = e ?? isBaby);
                        },
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

                  vPad10,

                  Row(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: customOutlineButton(
                          bg: customPurple,
                          isLoading: false,
                          onTap: () => Navigator.pop(context),
                          title: "Cancel",
                        ),
                      ),
                      Expanded(
                        child: customFilledButton(
                          bg: customPurple,
                          isLoading: false,
                          onTap: () {},
                          title: "Add Question",
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
