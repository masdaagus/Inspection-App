import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {
  var now = DateTime.now();
  String _shift;
  String _userName;
  String _idUser;

  String get shift => _shift;
  String get userName => _userName;
  String get idUser => _idUser;

  /// Initialize shift
  Future<String> shiftFormate() async {
    DateTime jam4 = DateTime(now.year, now.month, now.day, 16);
    DateTime jam23 = DateTime(now.year, now.month, now.day, 23, 59);
    DateTime jam8 = DateTime(now.year, now.month, now.day, 8);
    DateTime jam12 = DateTime(now.year, now.month, now.day, 0);

    if (now.compareTo(jam4) > 0 && now.compareTo(jam23) < 0) {
      _shift = '3';
    } else if (now.compareTo(jam8) > 0 && now.compareTo(jam4) < 0) {
      _shift = '2';
    } else if (now.compareTo(jam12) > 0 && now.compareTo(jam8) < 0) {
      _shift = '1';
    }
    print("shift = $_shift");
    update();
    return _shift;
  }

  /// Initialize User data
  Future getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _userName = preferences.getString("user");
    _idUser = preferences.getString("pass");
    update();
  }

  /// Logout
  Future signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("value", null);
    update();
  }

  @override
  void onInit() {
    shiftFormate();
    getUser();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

/// class checkbox
class Check extends GetxController {
  bool tesbox(bool val) {
    val = !val;
    update();
    return null;
  }
}
