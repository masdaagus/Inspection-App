import 'package:Inspection/Database/database_mill.dart';
import 'package:Inspection/data/data.dart';
import 'package:Inspection/models/mill_model.dart';
import 'package:Inspection/views/details_screen/home.dart';
import 'package:Inspection/views/penampung_database/bismilah.dart';
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
  List<bool> _data = [];

  @override
  void initState() {
    super.initState();
  }

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Bismillah()),
                    );
                  },
                  child: Icon(Icons.edit)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  addData();
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
                                                    value: data.line1,
                                                    onChanged: (value) {
                                                      provider.tesbox(
                                                          data.line1 = value);
                                                      print(data.code +
                                                          ' - ' +
                                                          data.line1
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
                                                  value: data.line2,
                                                  onChanged: (value) {
                                                    provider.tesbox(
                                                        data.line2 = value);
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

  Future addData() async {
    final mill = Mill(
      bf07: _listData[0].line1,
      fn07: _listData[1].line1,
      bf08: _listData[2].line1,
      fn08: _listData[3].line1,
      bf09: _listData[4].line1,
      fn09: _listData[5].line1,
      bf10: _listData[6].line1,
      fn10: _listData[7].line1,
      ng01: _listData[8].line1,
      ng02: _listData[9].line1,
      ng03: _listData[10].line1,
      ng04: _listData[11].line1,
      wf01: _listData[12].line1,
      wf02: _listData[13].line1,
      wf03: _listData[14].line1,
      wf04: _listData[15].line1,
      bc01: _listData[16].line1,
      bc02: _listData[17].line1,
      bf02: _listData[18].line1,
      fn02: _listData[19].line1,
      bf03: _listData[20].line1,
      fn03: _listData[21].line1,
      bf04: _listData[22].line1,
      fn04: _listData[23].line1,
      bf05: _listData[24].line1,
      fn05: _listData[25].line1,
      bf06: _listData[26].line1,
      fn06: _listData[27].line1,
      sc01: _listData[28].line1,
      sc02: _listData[29].line1,
      sc03: _listData[30].line1,
      be01: _listData[31].line1,
      bm01: _listData[32].line1,
      lq01: _listData[33].line1,
      lq02: _listData[34].line1,
      sr01: _listData[35].line1,
      bf01: _listData[36].line1,
      fn01: _listData[37].line1,
      rf01: _listData[38].line1,
    );

    await DatabaseMill.instance.create(mill);
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
