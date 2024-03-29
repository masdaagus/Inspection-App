import 'package:get/get.dart';

class Controller extends GetxController {
  var now = DateTime.now();
  String _shift;

  String get shift => _shift;

  Future<String> shiftFormate() async {
    DateTime jam4 = DateTime(now.year, now.month, now.day, 16);
    DateTime jam8 = DateTime(now.year, now.month, now.day, 8);
    DateTime jam12 = DateTime(now.year, now.month, now.day, 0);

    if (now.compareTo(jam4) > 0 && now.compareTo(jam12) < 0) {
      _shift = '3';
    } else if (now.compareTo(jam8) > 0 && now.compareTo(jam4) < 0) {
      _shift = '2';
    } else if (now.compareTo(jam12) > 0 && now.compareTo(jam8) < 0) {
      _shift = '1';
    } else {
      // _shift = '1';
    }
    print("shift = $_shift");
    update();
    return _shift;
  }

  @override
  void onInit() {
    shiftFormate();
    super.onInit();
  }
}

class Check extends GetxController {
  bool tesbox(bool val) {
    val = !val;
    update();
    return null;
  }
}
