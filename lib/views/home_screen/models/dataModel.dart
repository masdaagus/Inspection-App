import 'package:Inspection/data/data.dart';
import 'package:flutter/foundation.dart';

class DataModel extends ChangeNotifier {
  final List<DetailsData> _selected = [];

  bool isSelected(DetailsData item) {
    return _selected.contains(item);
  }

  void check(DetailsData item) {
    if (!_selected.contains(item)) {
      _selected.add(item);
      notifyListeners();
    } else {
      _selected.remove(item);
      notifyListeners();
    }
  }
}
