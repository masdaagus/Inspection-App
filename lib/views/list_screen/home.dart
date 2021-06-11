import 'package:Inspection/Database/database_mill.dart';
import 'package:Inspection/template/data.dart';
import 'package:Inspection/models/model_database/check_model.dart';
import 'package:Inspection/views/details_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../models/data_model.dart';

// ignore: must_be_immutable
class HomeListScreen extends StatefulWidget {
  @override
  _HomeListScreenState createState() => _HomeListScreenState();
}

class _HomeListScreenState extends State<HomeListScreen> {
  List<DataMill> _listData = [];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataModel>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "INSPECTION MILL",
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    print("Press");
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Bismillah()),
                    // );
                  },
                  child: Icon(Icons.edit)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // addData();
                  _listData.forEach((element) {
                    print(
                        "Line 1 = ${element.code} = ${element.description_1}");
                  });
                },
                child: Icon(
                  Icons.send_and_archive,
                ),
              ),
            )
          ],
        ),
        body: Material(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder(
                    future: fetchData(context),
                    builder: (context, snapshot) {
                      // Memasukkan hasil data ke dalam _listData
                      _listData = snapshot.data;

                      if (snapshot.data == null) {
                        return Container(
                            child: Center(child: Text("Loading...")));
                      } else {
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              DataMill data = snapshot.data[index];

                              return Column(
                                children: [
                                  Slidable(
                                    secondaryActions: <Widget>[
                                      iconSlide(data, context),
                                    ],
                                    actionExtentRatio: .20,
                                    actionPane: SlidableDrawerActionPane(),
                                    child: ListTile(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 7),
                                      title: Text(
                                        data.equipments,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Text(
                                        data.checkpoints,
                                      ),
                                      tileColor: Colors.grey[300],
                                      leading: Text(
                                        "\t4#6\n${data.code}",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 11),
                                      ),
                                      trailing: Container(
                                        width: 96,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // CheckBox Line 1
                                            Transform.scale(
                                                scale: .8,
                                                child: Consumer<DataModel>(
                                                  builder:
                                                      (context, model, _) =>
                                                          Checkbox(
                                                    value: data.checklist_1,
                                                    onChanged: (value) {
                                                      provider.tesbox(data
                                                          .checklist_1 = value);
                                                      print(data.code +
                                                          ' - ' +
                                                          data.checklist_1
                                                              .toString());
                                                    },
                                                  ),
                                                )),
                                            // CheckBox Line 2
                                            Transform.scale(
                                              scale: .8,
                                              child: Consumer<DataModel>(
                                                builder: (context, model, _) =>
                                                    Checkbox(
                                                  value: data.checklist_2,
                                                  onChanged: (value) {
                                                    provider.tesbox(data
                                                        .checklist_2 = value);
                                                    print('Line - 2');
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      dense: true,
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.black),
                                ],
                              );
                            });
                      }
                    },
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ));
  }

  Future addCheckData() async {
    final check_1 = Check(
      bf07: _listData[0].checklist_1,
      fn07: _listData[1].checklist_1,
      bf08: _listData[2].checklist_1,
      fn08: _listData[3].checklist_1,
      bf09: _listData[4].checklist_1,
      fn09: _listData[5].checklist_1,
      bf10: _listData[6].checklist_1,
      fn10: _listData[7].checklist_1,
      ng01: _listData[8].checklist_1,
      ng02: _listData[9].checklist_1,
      ng03: _listData[10].checklist_1,
      ng04: _listData[11].checklist_1,
      wf01: _listData[12].checklist_1,
      wf02: _listData[13].checklist_1,
      wf03: _listData[14].checklist_1,
      wf04: _listData[15].checklist_1,
      bc01: _listData[16].checklist_1,
      bc02: _listData[17].checklist_1,
      bf02: _listData[18].checklist_1,
      fn02: _listData[19].checklist_1,
      bf03: _listData[20].checklist_1,
      fn03: _listData[21].checklist_1,
      bf04: _listData[22].checklist_1,
      fn04: _listData[23].checklist_1,
      bf05: _listData[24].checklist_1,
      fn05: _listData[25].checklist_1,
      bf06: _listData[26].checklist_1,
      fn06: _listData[27].checklist_1,
      sc01: _listData[28].checklist_1,
      sc02: _listData[29].checklist_1,
      sc03: _listData[30].checklist_1,
      be01: _listData[31].checklist_1,
      bm01: _listData[32].checklist_1,
      lq01: _listData[33].checklist_1,
      lq02: _listData[34].checklist_1,
      sr01: _listData[35].checklist_1,
      bf01: _listData[36].checklist_1,
      fn01: _listData[37].checklist_1,
      rf01: _listData[38].checklist_1,
    );
    final check_2 = Check(
      bf07: _listData[0].checklist_2,
      fn07: _listData[1].checklist_2,
      bf08: _listData[2].checklist_2,
      fn08: _listData[3].checklist_2,
      bf09: _listData[4].checklist_2,
      fn09: _listData[5].checklist_2,
      bf10: _listData[6].checklist_2,
      fn10: _listData[7].checklist_2,
      ng01: _listData[8].checklist_2,
      ng02: _listData[9].checklist_2,
      ng03: _listData[10].checklist_2,
      ng04: _listData[11].checklist_2,
      wf01: _listData[12].checklist_2,
      wf02: _listData[13].checklist_2,
      wf03: _listData[14].checklist_2,
      wf04: _listData[15].checklist_2,
      bc01: _listData[16].checklist_2,
      bc02: _listData[17].checklist_2,
      bf02: _listData[18].checklist_2,
      fn02: _listData[19].checklist_2,
      bf03: _listData[20].checklist_2,
      fn03: _listData[21].checklist_2,
      bf04: _listData[22].checklist_2,
      fn04: _listData[23].checklist_2,
      bf05: _listData[24].checklist_2,
      fn05: _listData[25].checklist_2,
      bf06: _listData[26].checklist_2,
      fn06: _listData[27].checklist_2,
      sc01: _listData[28].checklist_2,
      sc02: _listData[29].checklist_2,
      sc03: _listData[30].checklist_2,
      be01: _listData[31].checklist_2,
      bm01: _listData[32].checklist_2,
      lq01: _listData[33].checklist_2,
      lq02: _listData[34].checklist_2,
      sr01: _listData[35].checklist_2,
      bf01: _listData[36].checklist_2,
      fn01: _listData[37].checklist_2,
      rf01: _listData[38].checklist_2,
    );

    await DatabaseMill.instance
        .create(table: tableCheck, mill: check_1.toJson());
    await DatabaseMill.instance
        .create(table: tableCheck, mill: check_2.toJson());
  }

  Widget iconSlide(DataMill data, BuildContext context) {
    return IconSlideAction(
      caption: 'Remarks',
      color: Colors.grey,
      icon: Icons.edit,
      onTap: () {
        print("Selectd ${data.code}");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(
                      data: data,
                    )));
      },
    );
  }
}
