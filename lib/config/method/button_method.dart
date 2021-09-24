import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Method extends GetxController {
  void dialog({Function onTap, String msg}) {
    Get.defaultDialog(
      buttonColor: Colors.white,
      confirmTextColor: Colors.grey[800],
      cancelTextColor: Colors.grey[800],
      middleText: msg,
      title: 'Inspection',
      textCancel: 'No',
      textConfirm: "Yes",
      onConfirm: onTap,
    );
  }

  void snack(String msg) {
    Get.snackbar(
      "Inspection",
      msg,
      duration: Duration(milliseconds: 2200),
      backgroundColor: Colors.blueGrey[700].withOpacity(.5),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(vertical: 14),
    );
  }
}
