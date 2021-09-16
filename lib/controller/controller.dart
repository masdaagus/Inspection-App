import 'package:get/get.dart';

class Controller extends GetxController {
  DateTime now = DateTime.now();
  String _shift;

  String get shift => _shift;
  // DateTime get now => now;

  String shiftFormate() {
    DateTime jam4 = DateTime(now.year, now.month, now.day, 16);
    DateTime jam8 = DateTime(now.year, now.month, now.day, 8);
    DateTime jam12 = DateTime(now.year, now.month, now.day, 23, 58);

    if (now.compareTo(jam4) > 0 && now.compareTo(jam12) < 0) {
      _shift = '3';
    } else if (now.compareTo(jam8) > 0 && now.compareTo(jam4) < 0) {
      _shift = '2';
    } else if (now.compareTo(jam12) > 0 && now.compareTo(jam8) < 0) {
      _shift = '1';
    }
    print(_shift);
    return _shift;
  }

  @override
  void onInit() {
    shiftFormate();
    super.onInit();
  }

  void tesbox(bool val) {
    val = !val;
    update();
  }
}
