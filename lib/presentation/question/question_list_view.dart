import 'package:chatter_matter_admin/application/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/model/question_model.dart';
import '../../application/repo/question_repo.dart';
import '../../common/app_bar.dart';
import '../../common/colors.dart';
import '../../common/custom_button.dart';
import '../../common/custom_dialouge.dart';
import '../../common/custom_text_style.dart';
import '../../common/padding.dart';
import '../../provider/category_provider.dart';
part 'add_question.dart';

class QuestionListView extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  const QuestionListView({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  State<QuestionListView> createState() => _QuestionListViewState();
}

class _QuestionListViewState extends State<QuestionListView> {
  bool isBaby = true;
  bool isLoading = false;
  final QuestionRepo questionRepo = QuestionRepo();
  // Category? category;
  QuestionModelList? questionModelList;

  // void fetchCategory() {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   print(widget.categoryId);
  //   Future.delayed(Duration(seconds: 1)).then((e) {
  //     final categories = Provider.of<CategoryProvider>(
  //       context,
  //       listen: false,
  //     ).categoryList;

  //     if (categories.isNotEmpty) {
  //       category = categories
  //           .where((test) => test.id == widget.categoryId)
  //           .first;
  //     }
  //   });
  //   setState(() {
  //     isLoading = false;
  //   });
  //   print(category);
  // }

  void fetchQuestions() async {
    setState(() {
      isLoading = true;
    });
    final (data, error) = await questionRepo.getQuestionPaginator(
      pageToken: questionModelList?.pageToken ?? "",
      categoryId: widget.categoryId,
      isBabyQuestion: isBaby,
    );
    if (data != null && questionModelList == null) {
      questionModelList = data;
    } else if (data != null && questionModelList != null) {
      questionModelList!.data.addAll(data.data);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchQuestions();
    // fetchCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : questionModelList == null
        ? Center(child: Text("No Data found"))
        : Column(
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
                              showAddQuestionDialog(
                                context: context,
                                // category: category!,
                                categoryId: widget.categoryId,
                                categoryName: widget.categoryName,
                              );
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
                                    questionModelList = null;
                                    fetchQuestions();
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
                                    questionModelList = null;
                                    fetchQuestions();
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
                            widget.categoryName,
                            style: titleLarge(
                              fontWeight: FontWeight.w500,
                              color: customBlack,
                            ),
                          ),
                        ),
                        Icon(Icons.chat_bubble_outline),
                        Text(
                          "${questionModelList?.count ?? 0} Questions",
                          style: titleMedium(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              Expanded(
                child: questionModelList!.data.isEmpty
                    ? Center(child: Text("No question added yet"))
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                        ),
                        itemCount: questionModelList?.data.length ?? 0,
                        itemBuilder: (context, index) {
                          final item = questionModelList!.data[index];
                          return Card(
                            color: Color(0xfff8f8f8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: primaryContainer,
                                width: 1.5,
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                "${index + 1}. ${item.title}",
                                style: bodyLarge(),
                              ),

                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 5,
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    color: customRed,
                                    size: 15,
                                  ),
                                  Text("${item.favoritesCount}"),
                                  hPad5,
                                  IconButton(
                                    onPressed: () {
                                      showDeleteDialogue(
                                        content:
                                            "question.. will be deleted permanently.",
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
                          );
                        },
                      ),
              ),
            ],
          );
  }
}
