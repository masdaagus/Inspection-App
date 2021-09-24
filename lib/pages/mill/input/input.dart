import 'dart:io';
import 'package:Inspection/config/method/button_method.dart';
import 'package:Inspection/controller/add_mill.dart';
import 'package:Inspection/controller/checkbox.dart';
import 'package:Inspection/controller/controller.dart';
import 'package:Inspection/pages/dashbord/dashbord.dart';
import 'package:Inspection/pages/mill/models/data.dart';
import 'package:Inspection/pages/mill/models/mill.dart';
import 'package:Inspection/widgets/header/header.dart';
import 'package:Inspection/widgets/input/list_item.dart';
import 'package:Inspection/widgets/input/list_item_mill.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputMill extends StatefulWidget {
  @override
  _InputMillState createState() => _InputMillState();
}

class _InputMillState extends State<InputMill> {
  List<DataMill> _data1 = [];
  List<DataMill> _data2 = [];
  String userName;
  String userId;

  Future getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userName = preferences.getString("user");
      userId = preferences.getString("pass");
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(Check());
    print("Update Input Mill");

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
            onPressed: () async {
              final c = Get.put(Method());
              c.dialog(
                  msg: "Apakah anda ingin keluar ?",
                  onTap: () => Get.offAll(Dashbaord()));
            },
          ),
          title: Text(
            "INSPECTION MILL",
            style: TextStyle(
                fontSize: 17,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  final c = Get.put(Method());
                  try {
                    final result = await InternetAddress.lookup(
                        'www.console.firebase.google.com');
                    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                      c.dialog(
                        msg: "Simpan Inspection ?",
                        onTap: () {
                          addData();
                          Get.offAll(Dashbaord());
                          Get.snackbar(
                            "Inspection",
                            "Inspection telah berhasil",
                            duration: Duration(milliseconds: 2500),
                            backgroundColor:
                                Colors.blueGrey[700].withOpacity(.5),
                            snackPosition: SnackPosition.TOP,
                            margin: EdgeInsets.symmetric(vertical: 14),
                          );
                        },
                      );
                    }
                  } on SocketException catch (_) {
                    c.snack("Cek Koneksi Internet anda");
                  }
                },
                child: Icon(Icons.send_and_archive, color: Colors.grey[800]),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.ac_unit_outlined,
                color: Colors.grey[800],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Header(
                  userName: userName,
                  userId: userId,
                ),
                FutureBuilder(
                  future: fetchData1(context),
                  builder: (context, snapshot) {
                    _data1 = snapshot.data;
                    return snapshot.data == null
                        ? Container()
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              DataMill data = snapshot.data[index];
                              return ListItem(
                                data: data,
                              );
                            },
                          );
                  },
                ),
                FutureBuilder(
                  future: fetchData2(context),
                  builder: (context, snapshot) {
                    _data2 = snapshot.data;
                    return snapshot.data == null
                        ? Container()
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              DataMill data = snapshot.data[index];
                              return ListMill(
                                data: data,
                              );
                            },
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addData() {
    final ctrl = Get.find<Controller>();
    final add = AddMill();
    final object = MillFirebase(
      userName: userName,
      idUser: userId,
      shift: ctrl.shift ?? '1',
      createTime: ctrl.now.toString(),

      // check line 1
      bf07l1: _data1[0].checklist_1,
      fn07l1: _data1[1].checklist_1,
      bf08l1: _data1[2].checklist_1,
      fn08l1: _data1[3].checklist_1,
      bf09l1: _data1[4].checklist_1,
      fn09l1: _data1[5].checklist_1,
      bf10l1: _data1[6].checklist_1,
      fn10l1: _data1[7].checklist_1,
      ng01l1: _data1[8].checklist_1,
      ng02l1: _data1[9].checklist_1,
      ng03l1: _data1[10].checklist_1,
      ng04l1: _data1[11].checklist_1,
      wf01l1: _data1[12].checklist_1,
      wf02l1: _data1[13].checklist_1,
      wf03l1: _data1[14].checklist_1,
      wf04l1: _data1[15].checklist_1,
      bc01l1: _data1[16].checklist_1,
      bc02l1: _data1[17].checklist_1,
      bf02l1: _data1[18].checklist_1,
      fn02l1: _data1[19].checklist_1,
      bf03l1: _data1[20].checklist_1,
      fn03l1: _data1[21].checklist_1,
      bf04l1: _data1[22].checklist_1,
      fn04l1: _data1[23].checklist_1,
      bf05l1: _data1[24].checklist_1,
      fn05l1: _data1[25].checklist_1,
      bf06l1: _data1[26].checklist_1,
      fn06l1: _data1[27].checklist_1,
      sc01l1: _data1[28].checklist_1,
      sc02l1: _data1[29].checklist_1,
      sc03l1: _data1[30].checklist_1,
      be01l1: _data1[31].checklist_1,
      bm01l1: _data1[32].checklist_1,
      lq01l1: _data1[33].checklist_1,
      lq02l1: _data1[34].checklist_1,
      sr01l1: _data1[35].checklist_1,
      bf01l1: _data1[36].checklist_1,
      fn01l1: _data1[37].checklist_1,
      rf01l1: _data1[38].checklist_1,
      pp1: _data1[39].checklist_1,

      // check line 2
      bf07l2: _data1[0].checklist_2,
      fn07l2: _data1[1].checklist_2,
      bf08l2: _data1[2].checklist_2,
      fn08l2: _data1[3].checklist_2,
      bf09l2: _data1[4].checklist_2,
      fn09l2: _data1[5].checklist_2,
      bf10l2: _data1[6].checklist_2,
      fn10l2: _data1[7].checklist_2,
      ng01l2: _data1[8].checklist_2,
      ng02l2: _data1[9].checklist_2,
      ng03l2: _data1[10].checklist_2,
      ng04l2: _data1[11].checklist_2,
      wf01l2: _data1[12].checklist_2,
      wf02l2: _data1[13].checklist_2,
      wf03l2: _data1[14].checklist_2,
      wf04l2: _data1[15].checklist_2,
      bc01l2: _data1[16].checklist_2,
      bc02l2: _data1[17].checklist_2,
      bf02l2: _data1[18].checklist_2,
      fn02l2: _data1[19].checklist_2,
      bf03l2: _data1[20].checklist_2,
      fn03l2: _data1[21].checklist_2,
      bf04l2: _data1[22].checklist_2,
      fn04l2: _data1[23].checklist_2,
      bf05l2: _data1[24].checklist_2,
      fn05l2: _data1[25].checklist_2,
      bf06l2: _data1[26].checklist_2,
      fn06l2: _data1[27].checklist_2,
      sc01l2: _data1[28].checklist_2,
      sc02l2: _data1[29].checklist_2,
      sc03l2: _data1[30].checklist_2,
      be01l2: _data1[31].checklist_2,
      bm01l2: _data1[32].checklist_2,
      lq01l2: _data1[33].checklist_2,
      lq02l2: _data1[34].checklist_2,
      sr01l2: _data1[35].checklist_2,
      bf01l2: _data1[36].checklist_2,
      fn01l2: _data1[37].checklist_2,
      rf01l2: _data1[38].checklist_2,
      pp2: _data1[39].checklist_2,

      // description line 1

      desbf07l1: _data1[0].description_1,
      desfn07l1: _data1[1].description_1,
      desbf08l1: _data1[2].description_1,
      desfn08l1: _data1[3].description_1,
      desbf09l1: _data1[4].description_1,
      desfn09l1: _data1[5].description_1,
      desbf10l1: _data1[6].description_1,
      desfn10l1: _data1[7].description_1,
      desng01l1: _data1[8].description_1,
      desng02l1: _data1[9].description_1,
      desng03l1: _data1[10].description_1,
      desng04l1: _data1[11].description_1,
      deswf01l1: _data1[12].description_1,
      deswf02l1: _data1[13].description_1,
      deswf03l1: _data1[14].description_1,
      deswf04l1: _data1[15].description_1,
      desbc01l1: _data1[16].description_1,
      desbc02l1: _data1[17].description_1,
      desbf02l1: _data1[18].description_1,
      desfn02l1: _data1[19].description_1,
      desbf03l1: _data1[20].description_1,
      desfn03l1: _data1[21].description_1,
      desbf04l1: _data1[22].description_1,
      desfn04l1: _data1[23].description_1,
      desbf05l1: _data1[24].description_1,
      desfn05l1: _data1[25].description_1,
      desbf06l1: _data1[26].description_1,
      desfn06l1: _data1[27].description_1,
      dessc01l1: _data1[28].description_1,
      dessc02l1: _data1[29].description_1,
      dessc03l1: _data1[30].description_1,
      desbe01l1: _data1[31].description_1,
      desbm01l1: _data1[32].description_1,
      deslq01l1: _data1[33].description_1,
      deslq02l1: _data1[34].description_1,
      dessr01l1: _data1[35].description_1,
      desbf01l1: _data1[36].description_1,
      desfn01l1: _data1[37].description_1,
      desrf01l1: _data1[38].description_1,
      despp1: _data1[39].description_1,

// description line 2
      desbf07l2: _data1[0].description_2,
      desfn07l2: _data1[1].description_2,
      desbf08l2: _data1[2].description_2,
      desfn08l2: _data1[3].description_2,
      desbf09l2: _data1[4].description_2,
      desfn09l2: _data1[5].description_2,
      desbf10l2: _data1[6].description_2,
      desfn10l2: _data1[7].description_2,
      desng01l2: _data1[8].description_2,
      desng02l2: _data1[9].description_2,
      desng03l2: _data1[10].description_2,
      desng04l2: _data1[11].description_2,
      deswf01l2: _data1[12].description_2,
      deswf02l2: _data1[13].description_2,
      deswf03l2: _data1[14].description_2,
      deswf04l2: _data1[15].description_2,
      desbc01l2: _data1[16].description_2,
      desbc02l2: _data1[17].description_2,
      desbf02l2: _data1[18].description_2,
      desfn02l2: _data1[19].description_2,
      desbf03l2: _data1[20].description_2,
      desfn03l2: _data1[21].description_2,
      desbf04l2: _data1[22].description_2,
      desfn04l2: _data1[23].description_2,
      desbf05l2: _data1[24].description_2,
      desfn05l2: _data1[25].description_2,
      desbf06l2: _data1[26].description_2,
      desfn06l2: _data1[27].description_2,
      dessc01l2: _data1[28].description_2,
      dessc02l2: _data1[29].description_2,
      dessc03l2: _data1[30].description_2,
      desbe01l2: _data1[31].description_2,
      desbm01l2: _data1[32].description_2,
      deslq01l2: _data1[33].description_2,
      deslq02l2: _data1[34].description_2,
      dessr01l2: _data1[35].description_2,
      desbf01l2: _data1[36].description_2,
      desfn01l2: _data1[37].description_2,
      desrf01l2: _data1[38].description_2,
      despp2: _data1[39].description_2,

// check special
      silo1: _data2[0].checklist_1,
      silo2: _data2[1].checklist_1,
      silo3: _data2[2].checklist_1,
      bf01: _data2[3].checklist_1,
      bf02: _data2[4].checklist_1,
      bf03: _data2[5].checklist_1,
      hg01: _data2[6].checklist_1,

      dessilo1: _data2[0].description_1,
      dessilo2: _data2[1].description_1,
      dessilo3: _data2[2].description_1,
      desbf01: _data2[3].description_1,
      desbf02: _data2[4].description_1,
      desbf03: _data2[5].description_1,
      deshg01: _data2[6].description_1,
    );

    add.addData("mill", object.toJson());
    return null;
  }
}
