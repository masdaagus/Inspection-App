import 'package:get/get.dart';

class Check extends GetxController {
  bool tesbox(bool val) {
    val = !val;
    update();
    return null;
  }
}
