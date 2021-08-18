import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Controller extends GetxController {
  final DateFormat f = new DateFormat('dd-MM-yyyy');
  final DateTime now = DateTime.now();
  String shift;

  String shiftFormate() {
    DateTime jam4 = DateTime(now.year, now.month, now.day, 16, 1);
    DateTime jam8 = DateTime(now.year, now.month, now.day, 8, 1);
    DateTime jam12 = DateTime(now.year, now.month, now.day, 23, 58);

    if (now.compareTo(jam4) > 0 && now.compareTo(jam12) < 0) {
      shift = '3';
    } else if (now.compareTo(jam8) > 0 && now.compareTo(jam4) < 0) {
      shift = '2';
    } else if (now.compareTo(jam12) > 0 && now.compareTo(jam8) < 0) {
      shift = '1';
    } else {
      shift = '2';
    }

    print(shift);
    return shift;
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
