import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TabMill extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object>> getData(String table) async {
    CollectionReference mill = firestore.collection(table);

    return mill.get();
  }

  // Future<void> openPDF() async {
  //   final invoice =
  //       Invoice(name: name, id: id, shift: shift, date: date, items: items);
  // }
}
