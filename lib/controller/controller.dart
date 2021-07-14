import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {
  DateFormat f = new DateFormat('dd-MM-yyyy');
  String userName;
  String userId;
  DateTime now = DateTime.now();
  String shift;

  String shiftFormate() {
    DateTime jam4 = DateTime(now.year, now.month, now.day, 16);
    DateTime jam8 = DateTime(now.year, now.month, now.day, 8);
    DateTime jam12 = DateTime(now.year, now.month, now.day, 23, 58);

    if (now.compareTo(jam4) > 0 && now.compareTo(jam12) < 0) {
      shift = '3';
    } else if (now.compareTo(jam8) > 0 && now.compareTo(jam4) < 0) {
      shift = '2';
    } else if (now.compareTo(jam12) > 0 && now.compareTo(jam8) < 0) {
      shift = '1';
    }
    return shift;
  }

  Future getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userName = preferences.getString("user");
    userId = preferences.getString("pass");
  }

  void tesbox(bool val) {
    val = !val;
    update();
  }
}
