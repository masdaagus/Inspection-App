import 'package:Inspection/config/method/button_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TabMill extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object>> getData(String table) async {
    CollectionReference mill = firestore.collection(table);

    return mill.get();
  }

  Future<void> deleteData(String id) async {
    DocumentReference docRef = firestore.collection('mill').doc(id);
    final c = Get.put(Method());

    return c.dialog(
        msg: 'Apakah anda ingin menghapus data ',
        onTap: () {
          docRef.delete();
          Get.back();
          Get.back();
        });
  }
}
