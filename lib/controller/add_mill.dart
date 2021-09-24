import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddMill extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addData(String table, Map<String, Object> object) {
    CollectionReference mill = firestore.collection(table);

    mill.add(object);
  }
}
