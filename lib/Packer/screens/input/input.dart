import 'package:Inspection/Database/database.dart';
import 'package:Inspection/Database/database_packer.dart';
import 'package:Inspection/Packer/models/data_packer.dart';
import 'package:Inspection/Packer/models/packer_model.dart';
import 'package:Inspection/controller/controller.dart';
import 'package:Inspection/widgets/header/header.dart';
import 'package:Inspection/widgets/input/list_item.dart';
import 'package:Inspection/widgets/input/list_item_packer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputPacker extends StatefulWidget {
  @override
  _InputPackerState createState() => _InputPackerState();
}

class _InputPackerState extends State<InputPacker> {
  final ctrl = Get.find<Controller>();

  // Get data
  List<DataPacker> _data1 = [];
  List<DataPacker> _data2 = [];

  // Get user
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Text(
            "Inspection Packer",
            style: TextStyle(
                fontSize: 17,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
            onPressed: () {
              _alertBack();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  _alertPacker();
                },
                child: Icon(Icons.send_and_archive, color: Colors.grey[800]),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<Controller>(
                builder: (header) {
                  return Header(
                    userName: userName,
                    userId: userId,
                    shift: "${header.shift}",
                    date: header.now,
                  );
                },
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
                            DataPacker data = snapshot.data[index];
                            return ListPacker(
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
                            DataPacker data = snapshot.data[index];
                            return ListItem(
                              data: data,
                            );
                          },
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future addData() async {
    final inputData = Packer(
      userName: userName,
      idUser: userId,
      shift: ctrl.shift ?? '2',
      createTime: ctrl.now,

      // Line 1
      sg011: _data1[0].checklist_1,
      pg011: _data1[1].checklist_1,
      as011: _data1[2].checklist_1,
      as021: _data1[3].checklist_1,
      bl1: _data1[4].checklist_1,
      be01611: _data2[0].checklist_1,
      as031: _data2[1].checklist_1,
      pg021: _data2[2].checklist_1,
      pg031: _data2[3].checklist_1,
      bf1: _data2[4].checklist_1,
      vs011: _data2[5].checklist_1,
      be01661: _data2[6].checklist_1,
      sc011: _data2[7].checklist_1,
      bb1: _data2[8].checklist_1,
      asb1: _data2[9].checklist_1,
      la1: _data2[10].checklist_1,
      b3b1: _data2[11].checklist_1,
      bf011: _data2[12].checklist_1,
      rf011: _data2[13].checklist_1,
      sc031: _data2[14].checklist_1,
      sc041: _data2[15].checklist_1,
      as041: _data2[16].checklist_1,
      fn011: _data2[17].checklist_1,
      pm011: _data2[18].checklist_1,
      bc011: _data2[19].checklist_1,
      bn011: _data2[20].checklist_1,
      bw011: _data2[21].checklist_1,
      rb011: _data2[22].checklist_1,
      ip1: _data2[23].checklist_1,
      sc021: _data2[24].checklist_1,
      bc021: _data2[25].checklist_1,
      bd011: _data2[26].checklist_1,
      tbc011: _data2[27].checklist_1,
      lbc021: _data2[28].checklist_1,
      tbc031: _data2[29].checklist_1,
      lbc041: _data2[30].checklist_1,
      tk1: _data2[31].checklist_1,
      dr1: _data2[32].checklist_1,

      // Line 2
      sg012: _data1[0].checklist_2,
      pg012: _data1[1].checklist_2,
      as012: _data1[2].checklist_2,
      as022: _data1[3].checklist_2,
      bl2: _data1[4].checklist_2,
      be01612: _data2[0].checklist_2,
      as032: _data2[1].checklist_2,
      pg022: _data2[2].checklist_2,
      pg032: _data2[3].checklist_2,
      bf2: _data2[4].checklist_2,
      vs012: _data2[5].checklist_2,
      be01662: _data2[6].checklist_2,
      sc012: _data2[7].checklist_2,
      bb2: _data2[8].checklist_2,
      asb2: _data2[9].checklist_2,
      la2: _data2[10].checklist_2,
      b3b2: _data2[11].checklist_2,
      bf012: _data2[12].checklist_2,
      rf012: _data2[13].checklist_2,
      sc032: _data2[14].checklist_2,
      sc042: _data2[15].checklist_2,
      as042: _data2[16].checklist_2,
      fn012: _data2[17].checklist_2,
      pm012: _data2[18].checklist_2,
      bc012: _data2[19].checklist_2,
      bn012: _data2[20].checklist_2,
      bw012: _data2[21].checklist_2,
      rb012: _data2[22].checklist_2,
      ip2: _data2[23].checklist_2,
      sc022: _data2[24].checklist_2,
      bc022: _data2[25].checklist_2,
      bd012: _data2[26].checklist_2,
      tbc012: _data2[27].checklist_2,
      lbc022: _data2[28].checklist_2,
      tbc032: _data2[29].checklist_2,
      lbc042: _data2[30].checklist_2,
      tk2: _data2[31].checklist_2,
      dr2: _data2[32].checklist_2,

      // Line 3
      sg013: _data1[0].checklist_3,
      pg013: _data1[1].checklist_3,
      as013: _data1[2].checklist_3,
      as023: _data1[3].checklist_3,
      bl3: _data1[4].checklist_3,

      // Dess Line 1
      dessg011: _data1[0].description_1,
      despg011: _data1[1].description_1,
      desas011: _data1[2].description_1,
      desas021: _data1[3].description_1,
      desbl1: _data1[4].description_1,
      desbe01611: _data2[0].description_1,
      desas031: _data2[1].description_1,
      despg021: _data2[2].description_1,
      despg031: _data2[3].description_1,
      desbf1: _data2[4].description_1,
      desvs011: _data2[5].description_1,
      desbe01661: _data2[6].description_1,
      dessc011: _data2[7].description_1,
      desbb1: _data2[8].description_1,
      desasb1: _data2[9].description_1,
      desla1: _data2[10].description_1,
      desb3b1: _data2[11].description_1,
      desbf011: _data2[12].description_1,
      desrf011: _data2[13].description_1,
      dessc031: _data2[14].description_1,
      dessc041: _data2[15].description_1,
      desas041: _data2[16].description_1,
      desfn011: _data2[17].description_1,
      despm011: _data2[18].description_1,
      desbc011: _data2[19].description_1,
      desbn011: _data2[20].description_1,
      desbw011: _data2[21].description_1,
      desrb011: _data2[22].description_1,
      desip1: _data2[23].description_1,
      dessc021: _data2[24].description_1,
      desbc021: _data2[25].description_1,
      desbd011: _data2[26].description_1,
      destbc011: _data2[27].description_1,
      deslbc021: _data2[28].description_1,
      destbc031: _data2[29].description_1,
      deslbc041: _data2[30].description_1,
      destk1: _data2[31].description_1,
      desdr1: _data2[32].description_1,

      // Dess Line 2

      dessg012: _data1[0].description_2,
      despg012: _data1[1].description_2,
      desas012: _data1[2].description_2,
      desas022: _data1[3].description_2,
      desbl2: _data1[4].description_2,
      desbe01612: _data2[0].description_2,
      desas032: _data2[1].description_2,
      despg022: _data2[2].description_2,
      despg032: _data2[3].description_2,
      desbf2: _data2[4].description_2,
      desvs012: _data2[5].description_2,
      desbe01662: _data2[6].description_2,
      dessc012: _data2[7].description_2,
      desbb2: _data2[8].description_2,
      desasb2: _data2[9].description_2,
      desla2: _data2[10].description_2,
      desb3b2: _data2[11].description_2,
      desbf012: _data2[12].description_2,
      desrf012: _data2[13].description_2,
      dessc032: _data2[14].description_2,
      dessc042: _data2[15].description_2,
      desas042: _data2[16].description_2,
      desfn012: _data2[17].description_2,
      despm012: _data2[18].description_2,
      desbc012: _data2[19].description_2,
      desbn012: _data2[20].description_2,
      desbw012: _data2[21].description_2,
      desrb012: _data2[22].description_2,
      desip2: _data2[23].description_2,
      dessc022: _data2[24].description_2,
      desbc022: _data2[25].description_2,
      desbd012: _data2[26].description_2,
      destbc012: _data2[27].description_2,
      deslbc022: _data2[28].description_2,
      destbc032: _data2[29].description_2,
      deslbc042: _data2[30].description_2,
      destk2: _data2[31].description_2,
      desdr2: _data2[32].description_2,

      // Dess Line 3

      dessg013: _data1[0].description_3,
      despg013: _data1[1].description_3,
      desas013: _data1[2].description_3,
      desas023: _data1[3].description_3,
      desbl3: _data1[4].description_3,
    );

    await DatabaseMill.instance
        .create(table: tablePacker, object: inputData.toJson());
  }

  Future<void> _alertPacker() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Send Inspection ?'),
          title: Text('Inspection'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                addData();
                Navigator.pop(context, "Yes");
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, "No");
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _alertBack() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Keluar Halaman ?'),
          title: Text('Inspection'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, "Yes");
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, "No");
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
