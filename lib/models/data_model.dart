import 'package:Inspection/data/data.dart';
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

  // final List<DetailsData> _selected1 = [];
  // final List<DetailsData> _selected2 = [];
  // // final List<bool> _list = [];
  // List get masda => _list;

  // bool isSelected1(DetailsData item) {
  //   return _selected1.contains(item);
  // }

  // void check1(DetailsData item) {
  //   if (!_selected1.contains(item)) {
  //     _selected1.add(item);
  //     notifyListeners();
  //   } else {
  //     _selected1.remove(item);
  //     notifyListeners();
  //   }
  // }

  // bool isSelected2(DetailsData item) {
  //   return _selected2.contains(item);
  // }

  // void check2(DetailsData item) {
  //   if (!_selected2.contains(item)) {
  //     _selected2.add(item);
  //     notifyListeners();
  //   } else {
  //     _selected2.remove(item);
  //     notifyListeners();
  //   }
  // }

}
