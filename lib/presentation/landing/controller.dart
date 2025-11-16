part of 'landing_view.dart';

class LandingController extends ChangeNotifier {
  String selectedCategory = "";
  int currentIndex = 0;
  void changeView(String val, int index) {
    selectedCategory = val;
    currentIndex = index;
    notify();
  }

  final children = [HomeView(), CategoryListView()];

  void notify() {
    if (hasListeners) notifyListeners();
  }
}
