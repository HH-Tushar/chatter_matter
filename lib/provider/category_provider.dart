import 'package:chatter_matter_admin/application/local_data/category_local_data.dart';
import 'package:flutter/widgets.dart';

import '../application/model/category_model.dart';
import '../application/repo/category_repo.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryProvider() {
    getCategoryList();
  }

  bool isLoading = false;
  bool isFetchingCategory = false;
  bool isAddingCategory = false;

  final CategoryRepo categoryRepo = CategoryRepo();
  List<Category> categoryList = [];

  void getCategoryList() async {
    isFetchingCategory = true;
    notifyListeners();
    final (data, error) = await categoryRepo.getCategoryList();
    if (data != null) {
      categoryList = data.data;
    }
    isFetchingCategory = false;
    notifyListeners();
  }

  Future<bool> addCategory(Category data) async {
    final (feedback, error) = await categoryRepo.addCategory(data);
    if (feedback != null) {
      categoryList.add(feedback);
    }
    notifyListeners();
    return feedback != null ? true : false;
  }

  Future<bool> updateCategory(Category data) async {
    isAddingCategory = true;
    notifyListeners();

    // if true

    categoryList.removeWhere((e) => e.id == data.id);
    categoryList.add(data);
    notifyListeners();
    isAddingCategory = false;
    notifyListeners();
    return true;
  }

  Future<bool> removeCategory(Category data) async {
    isAddingCategory = true;
    notifyListeners();
    categoryList.remove(data);
    isAddingCategory = false;
    notifyListeners();
    return true;
  }



Future<void> getQuestion()async{

  // http://127.0.0.1:5001/demo-no-project/us-central1/api/getQuestionPaginator?categoryId=cat001&limit=10&pageToken=lololo
}

}
