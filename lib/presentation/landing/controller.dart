part of 'landing_view.dart';

class LandingController extends ChangeNotifier {
  String selectedCategory = "";

  void changeView(String val) {
    selectedCategory = val;
    notify();
  }

  void notify() {
    if (hasListeners) notifyListeners();
  }
}
