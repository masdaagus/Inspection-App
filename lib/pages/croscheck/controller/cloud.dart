import 'package:Inspection/config/method/button_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CrossCheckController extends GetxController {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  /// Create data
  Future<void> addData(Map<String, Object> object) {
    CollectionReference crosscheck = instance.collection('crosscheck');

    return crosscheck.add(object);
  }

  /// Fetch data
  Future<QuerySnapshot<Object>> getData() async {
    CollectionReference crosscheck = instance.collection('crosscheck');

    return crosscheck.orderBy('time', descending: true).get();
  }

  /// Delete data
  Future<void> deleteData(String id) async {
    DocumentReference docRef = instance.collection('crosscheck').doc(id);
    final c = Get.put(Method());

    return c.dialog(
      msg: 'Apakah anda ingin menghapus data ',
      onTap: () {
        docRef.delete();
        Get.back();
        Get.back();
      },
    );
  }
}
