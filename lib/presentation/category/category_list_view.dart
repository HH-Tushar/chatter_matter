import 'package:chatter_matter_admin/common/colors.dart';
import 'package:chatter_matter_admin/common/custom_dialouge.dart';
import 'package:chatter_matter_admin/common/custom_text_style.dart';
import 'package:chatter_matter_admin/common/padding.dart';
import 'package:chatter_matter_admin/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../application/model/category_model.dart';
import '../../common/app_bar.dart';
import '../../common/custom_button.dart';
import '../../common/custom_formatter.dart';
import '../../common/custom_input.dart';
import '../../core/formater.dart';
import '../../provider/category_provider.dart';

part 'add_category.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryProvider controller = context.watch();
    return Column(
      children: [
        Column(
          children: [
            customAppBar(
              title: "Category Management",
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
                Expanded(
                  child: DropdownButtonFormField(
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Select Category",
                      fillColor: customWhite,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      prefixIcon: Icon(Icons.filter_alt_outlined),
                    ),

                    borderRadius: BorderRadius.circular(12),

                    items: [
                      DropdownMenuItem(
                        value: "all",
                        child: Text("All Category"),
                      ),
                      DropdownMenuItem(
                        value: "all3",
                        child: Text("All Category"),
                      ),
                    ],
                    onChanged: (e) async {},
                  ),
                ),

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
                      showAddCategoryDialog(context: context);
                    },
                    label: Text(
                      "Add Category",
                      style: bodyMedium(color: customWhite),
                    ),
                    icon: Icon(Icons.add, color: customWhite),
                  ),
                ),
              ],
            ),
          ],
        ),

        Expanded(
          child: ListView.builder(
            // padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            itemCount: controller.categoryList.length,
            itemBuilder: (context, index) {
              final item = controller.categoryList[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                color: Color(int.parse(item.colorCode)),
                child: MaterialButton(
                  onPressed: () => context.go(
                    "${CustomRoute.question}/${controller.categoryList[index].id}-${controller.categoryList[index].title}",
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: titleMedium(
                                  fontWeight: FontWeight.w500,
                                  color: customWhite,
                                ),
                              ),
                              Text(
                                item.subTitle.trim(),
                                style: bodyMedium(color: customWhite),
                              ),
                              vPad10,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    "assets/common/category_left_icon.svg",
                                    height: 24,
                                  ),
                                  hPad30,
                                  Icon(
                                    Icons.chat_bubble_outline,
                                    color: customWhite,
                                  ),
                                  hPad10,
                                  Text(
                                    "${item.questionCount} questions",
                                    style: bodyMedium(color: customWhite),
                                  ),
                                  hPad30,
                                  Icon(Icons.favorite, color: Colors.red),
                                  hPad10,
                                  Text(
                                    "${item.favoritesCount} favorites",
                                    style: bodyMedium(color: customWhite),
                                  ),
                                  hPad30,
                                  Text(
                                    "Updated At : ${item.updatedAt != null ? customDateFormatter(item.updatedAt!) : "N/A"}",
                                    style: bodyMedium(color: customWhite),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: () => showAddCategoryDialog(
                            context: context,
                            oldItem: item,
                          ),
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              color: Color(0xffE0E0E0),
                              borderRadius: BorderRadius.circular(8),
                            ),

                            child: Icon(Icons.edit),
                          ),
                        ),

                        GestureDetector(
                          onTap: () async {
                            final check = await showDeleteDialogue(
                              context: context,
                              content: "${item.title} will be deleted forever.",
                              title: "Delete Category..??",
                            );
                            if (check == true) {
                              controller.removeCategory(item);
                            }
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),

                            child: Icon(
                              Icons.delete_forever_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
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
