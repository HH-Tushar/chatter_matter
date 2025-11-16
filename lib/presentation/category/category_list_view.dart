import 'package:chatter_matter_admin/common/colors.dart';
import 'package:chatter_matter_admin/common/custom_text_style.dart';
import 'package:chatter_matter_admin/common/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/app_bar.dart';
part 'add_category.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              customAppBar(),
              vPad15,

              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
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
                        showBasicDialog(context: context);
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
        ),

        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            itemCount: 10,
            itemBuilder: (context, index) => Card(
              color: primaryColor,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reflection on the day",
                            style: titleMedium(
                              fontWeight: FontWeight.w500,
                              color: customWhite,
                            ),
                          ),

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
                                "45 questions",
                                style: bodyMedium(color: customWhite),
                              ),
                              hPad30,
                              Icon(Icons.favorite, color: Colors.red),
                              hPad10,
                              Text(
                                "80 favorites",
                                style: bodyMedium(color: customWhite),
                              ),
                              hPad30,
                              Text(
                                "Created At : 2025-10-15",
                                style: bodyMedium(color: customWhite),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        color: Color(0xffE0E0E0),
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: Icon(Icons.edit),
                    ),
                    Container(
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
