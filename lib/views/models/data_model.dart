import 'package:flutter/foundation.dart';

class DataModel extends ChangeNotifier {
  String lineBerapa = '?';
  void line1() {
    lineBerapa = '1';
    notifyListeners();
  }

  void line2() {
    lineBerapa = '2';
    notifyListeners();
  }

  void tesbox(bool val) {
    val = !val;
    // _list.add(!val);
    notifyListeners();
  }
}
