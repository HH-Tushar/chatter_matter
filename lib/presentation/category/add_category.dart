part of 'category_list_view.dart';

void showBasicDialog({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          // height: 500,
          width: 500,
          padding: EdgeInsets.all(defaultPadding),
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

              Text("Category", style: titleSmall(fontWeight: FontWeight.w600)),
              vPad10,
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Category name..",
                  filled: true,
                  fillColor: Color(0xffF8F8F8),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                ),
              ),
              vPad15,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          10,
                          (ind) => Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10),
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
                    label: Text("Add", style: bodyMedium(color: customWhite)),
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
                    child: MaterialButton(
                      height: 50,
                      minWidth: double.infinity,
                      elevation: 1,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: customPurple),
                      ),

                      onPressed: () {},

                      child: Center(
                        child: Text(
                          "Cancel",
                          style: titleSmall(color: customPurple),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      height: 50,
                      minWidth: double.infinity,
                      elevation: 1,
                      color: customPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),

                      onPressed: () {},

                      child: Center(
                        child: Text(
                          "Add Category",
                          style: titleSmall(color: customWhite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
