import 'dart:io';

import 'package:Inspection/config/method/button_method.dart';
import 'package:Inspection/controller/controller.dart';
import 'package:Inspection/pages/croscheck/controller/cloud.dart';
import 'package:Inspection/pages/croscheck/controller/math.dart';
import 'package:Inspection/pages/croscheck/model/model-cc.dart';
import 'package:Inspection/pages/dashbord/dashbord.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Future<void> addData() async {
    final math = Get.put(MathCalculation());
    final controller = Get.put(Controller());
    final cloud = Get.put(CrossCheckController());
    final c = Get.put(Method());

    final object = CrossCheck(
      userName: controller.userName,
      idUser: controller.idUser,
      shift: controller.shift,
      time: controller.now.toString(),
      line: math.selected.toString(),
      material: math.material.toString(),
      feeding: math.f,
      percentage: math.p,
      setPoint: math.setPoint,
      actualWf: math.actwf,
      error: math.error,
      timer: math.avarage,
      weight: math.weight,
    );

    if (math.avarage == null || math.weight == null) {
      c.snack('Lengkapi semua data');
    } else {
      try {
        final result = await InternetAddress.lookup('www.google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          if (math.weight == null) {
            print("kosong");
          } else {
            print("enggak kosong");
            c.dialog(
              msg: "Simpan Hasil Sampling ?",
              onTap: () async {
                await cloud.addData(object.toJson());
                Get.offAll(Dashbaord());
                c.snack('Inspection telah berhasil');
              },
            );
          }
        }
      } on SocketException catch (_) {
        c.snack("Cek Koneksi Internet anda");
      }
    }

    return;
  }
}
