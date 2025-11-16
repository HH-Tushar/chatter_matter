part of 'landing_view.dart';

class LandingController extends ChangeNotifier {
  String selectedCategory = "";

  void changeView(String val) {
    selectedCategory = val;
    notify();
  }

  int currentIndex = 0;
  final children = [HomeView()];

  void notify() {
    if (hasListeners) notifyListeners();
  }
}
