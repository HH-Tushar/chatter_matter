import 'package:chatter_matter_admin/application/local_data/category_local_data.dart';
import 'package:flutter/widgets.dart';

import '../application/model/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isFetchingCategory = false;
  bool isAddingCategory = false;

  List<Category> categoryList = localCategory;

  Future<bool> updateCategory(Category data) async {
    isAddingCategory = true;
    notifyListeners();
    categoryList.add(data);
    isAddingCategory = false;
    notifyListeners();
    return true;
  }
}
