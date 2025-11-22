import 'package:flutter/material.dart';

import '../../common/app_bar.dart';
import '../../common/colors.dart';
import '../../common/custom_button.dart';
import '../../common/custom_dialouge.dart';
import '../../common/custom_text_style.dart';
import '../../common/padding.dart';
part 'add_question.dart';

class QuestionListView extends StatefulWidget {
  const QuestionListView({super.key});

  @override
  State<QuestionListView> createState() => _QuestionListViewState();
}

class _QuestionListViewState extends State<QuestionListView> {
  bool isBaby = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customAppBar(
                title: "Question Management",
                subTitle: "Add, edit, and manage questions",
              ),
              vPad15,

              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                         hintText: "Search here..",
                        fillColor: customWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),

                  Expanded(child: vPad5),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        // fixedSize: Size(200, 50),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        showAddQuestionDialog(context: context);
                      },
                      label: Text(
                        "Add Question",
                        style: bodyMedium(color: customWhite),
                      ),
                      icon: Icon(Icons.add, color: customWhite),
                    ),
                  ),
                ],
              ),

              vPad20,

              Container(
                height: 60,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: customWhite,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: isBaby
                          ? null
                          : () => setState(() {
                              isBaby = true;
                            }),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: Size(150, 50),
                        disabledBackgroundColor: customWhite,
                        backgroundColor: Colors.grey.shade100,
                      ),
                      child: Text("4-10 Years", style: titleSmall()),
                    ),
                    ElevatedButton(
                      onPressed: !isBaby
                          ? null
                          : () => setState(() {
                              isBaby = false;
                            }),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: Size(150, 50),
                        disabledBackgroundColor: customWhite,
                        backgroundColor: Colors.grey.shade100,
                      ),
                      child: Text("10+ Years", style: titleSmall()),
                    ),
                  ],
                ),
              ),
              vPad20,
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Text(
                      "Category Name",
                      style: titleLarge(
                        fontWeight: FontWeight.w500,
                        color: customBlack,
                      ),
                    ),
                  ),
                  Icon(Icons.chat_bubble_outline),
                  Text(
                    "45 questions",
                    style: titleMedium(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            itemCount: 20,
            itemBuilder: (context, index) => Card(
              color: Color(0xfff8f8f8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: primaryContainer, width: 1.5),
              ),
              child: ListTile(
                title: Text("${index + 1}. Question?", style: bodyLarge()),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 5,
                  children: [
                    Icon(Icons.favorite_border, color: customRed, size: 15),
                    Text("45"),
                    hPad5,
                    IconButton(
                      onPressed: () {
                        showDeleteDialogue(
                          content: "question.. will be deleted permanently.",
                          title: "Delete Question..!!",
                          context: context,
                        );
                      },
                      icon: Icon(
                        Icons.delete_forever,
                        color: customRed,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
