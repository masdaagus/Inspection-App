import 'package:Inspection/Database/database_mill.dart';
import 'package:Inspection/model_database/mill_model.dart';
import 'package:Inspection/models/data_model.dart';
import 'package:Inspection/template/data.dart';
import 'package:Inspection/views/const/const.dart';
import 'package:Inspection/views/input_detail_screen/input_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeListScreen extends StatefulWidget {
  @override
  _HomeListScreenState createState() => _HomeListScreenState();
}

class _HomeListScreenState extends State<HomeListScreen> {
  List<DataMill> _listData = [];

  DateTime now = DateTime.now();
  DateFormat f = new DateFormat('dd-MM-yyyy');
  int jam12 = 0;

  @override
  Widget build(BuildContext context) {
    print("update screen");
    final provider = Provider.of<DataModel>(context, listen: false);

    return Scaffold(
      backgroundColor: bagroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bagroundColor,
        centerTitle: true,
        title: Text(
          "INSPECTION MILL",
          style: TextStyle(fontSize: 17),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                // addCheckData();
              },
              child: Icon(Icons.send_and_archive),
            ),
          )
        ],
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: edge10,
                padding: edge10,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: bagroundId,
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person, size: 40),
                            SizedBox(width: 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Masda agus",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "83748798",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Shift 3",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500)),
                            Text(f.format(now),
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        SizedBox(width: 3),
                        IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: now,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2022),
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.dark(),
                                      child: child,
                                    );
                                  }).then((value) {
                                if (value != null) {
                                  print(value);
                                  setState(() {
                                    now = value;
                                  });
                                }
                              });
                            })
                        // Icon(Icons.calendar_today, size: 28),
                      ],
                    )
                  ],
                ),
              ),
              FutureBuilder(
                future: fetchData(context),
                builder: (context, snapshot) {
                  // Memasukkan hasil data ke dalam _listData
                  _listData = snapshot.data;

                  if (snapshot.data == null) {
                    return Container(child: Center(child: Text("Loading...")));
                  } else {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          DataMill data = snapshot.data[index];

                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffced4da)),
                                child: Slidable(
                                  secondaryActions: <Widget>[
                                    iconSlide(data, context),
                                  ],
                                  actionExtentRatio: .20,
                                  actionPane: SlidableDrawerActionPane(),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    title: Text(
                                      data.equipments,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    subtitle: Text(
                                      data.checkpoints,
                                    ),
                                    leading: Text(
                                      "\t4#6\n${data.code}",
                                      style: TextStyle(
                                          color: Colors.black45, fontSize: 11),
                                    ),
                                    trailing: Container(
                                      width: 100,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // CheckBox Line 1
                                          Transform.scale(
                                              scale: .9,
                                              child: Consumer<DataModel>(
                                                builder: (context, model, _) =>
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
                                            scale: .9,
                                            child: Consumer<DataModel>(
                                              builder: (context, model, _) =>
                                                  Checkbox(
                                                value: data.checklist_2,
                                                onChanged: (value) {
                                                  provider.tesbox(
                                                      data.checklist_2 = value);
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
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Divider(
                                    height: .5, color: Color(0xff001f30)),
                              ),
                            ],
                          );
                        });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future addCheckData() async {
    final inputToDatasbe = Mill(
      createTime: now,

      // Line 1
      bf07l1: _listData[0].checklist_1,
      fn07l1: _listData[1].checklist_1,
      bf08l1: _listData[2].checklist_1,
      fn08l1: _listData[3].checklist_1,
      bf09l1: _listData[4].checklist_1,
      fn09l1: _listData[5].checklist_1,
      bf10l1: _listData[6].checklist_1,
      fn10l1: _listData[7].checklist_1,
      ng01l1: _listData[8].checklist_1,
      ng02l1: _listData[9].checklist_1,
      ng03l1: _listData[10].checklist_1,
      ng04l1: _listData[11].checklist_1,
      wf01l1: _listData[12].checklist_1,
      wf02l1: _listData[13].checklist_1,
      wf03l1: _listData[14].checklist_1,
      wf04l1: _listData[15].checklist_1,
      bc01l1: _listData[16].checklist_1,
      bc02l1: _listData[17].checklist_1,
      bf02l1: _listData[18].checklist_1,
      fn02l1: _listData[19].checklist_1,
      bf03l1: _listData[20].checklist_1,
      fn03l1: _listData[21].checklist_1,
      bf04l1: _listData[22].checklist_1,
      fn04l1: _listData[23].checklist_1,
      bf05l1: _listData[24].checklist_1,
      fn05l1: _listData[25].checklist_1,
      bf06l1: _listData[26].checklist_1,
      fn06l1: _listData[27].checklist_1,
      sc01l1: _listData[28].checklist_1,
      sc02l1: _listData[29].checklist_1,
      sc03l1: _listData[30].checklist_1,
      be01l1: _listData[31].checklist_1,
      bm01l1: _listData[32].checklist_1,
      lq01l1: _listData[33].checklist_1,
      lq02l1: _listData[34].checklist_1,
      sr01l1: _listData[35].checklist_1,
      bf01l1: _listData[36].checklist_1,
      fn01l1: _listData[37].checklist_1,
      rf01l1: _listData[38].checklist_1,

      // Line 2
      bf07l2: _listData[0].checklist_2,
      fn07l2: _listData[1].checklist_2,
      bf08l2: _listData[2].checklist_2,
      fn08l2: _listData[3].checklist_2,
      bf09l2: _listData[4].checklist_2,
      fn09l2: _listData[5].checklist_2,
      bf10l2: _listData[6].checklist_2,
      fn10l2: _listData[7].checklist_2,
      ng01l2: _listData[8].checklist_2,
      ng02l2: _listData[9].checklist_2,
      ng03l2: _listData[10].checklist_2,
      ng04l2: _listData[11].checklist_2,
      wf01l2: _listData[12].checklist_2,
      wf02l2: _listData[13].checklist_2,
      wf03l2: _listData[14].checklist_2,
      wf04l2: _listData[15].checklist_2,
      bc01l2: _listData[16].checklist_2,
      bc02l2: _listData[17].checklist_2,
      bf02l2: _listData[18].checklist_2,
      fn02l2: _listData[19].checklist_2,
      bf03l2: _listData[20].checklist_2,
      fn03l2: _listData[21].checklist_2,
      bf04l2: _listData[22].checklist_2,
      fn04l2: _listData[23].checklist_2,
      bf05l2: _listData[24].checklist_2,
      fn05l2: _listData[25].checklist_2,
      bf06l2: _listData[26].checklist_2,
      fn06l2: _listData[27].checklist_2,
      sc01l2: _listData[28].checklist_2,
      sc02l2: _listData[29].checklist_2,
      sc03l2: _listData[30].checklist_2,
      be01l2: _listData[31].checklist_2,
      bm01l2: _listData[32].checklist_2,
      lq01l2: _listData[33].checklist_2,
      lq02l2: _listData[34].checklist_2,
      sr01l2: _listData[35].checklist_2,
      bf01l2: _listData[36].checklist_2,
      fn01l2: _listData[37].checklist_2,
      rf01l2: _listData[38].checklist_2,

      // Line 1
      desbf07l1: _listData[0].description_1,
      desfn07l1: _listData[1].description_1,
      desbf08l1: _listData[2].description_1,
      desfn08l1: _listData[3].description_1,
      desbf09l1: _listData[4].description_1,
      desfn09l1: _listData[5].description_1,
      desbf10l1: _listData[6].description_1,
      desfn10l1: _listData[7].description_1,
      desng01l1: _listData[8].description_1,
      desng02l1: _listData[9].description_1,
      desng03l1: _listData[10].description_1,
      desng04l1: _listData[11].description_1,
      deswf01l1: _listData[12].description_1,
      deswf02l1: _listData[13].description_1,
      deswf03l1: _listData[14].description_1,
      deswf04l1: _listData[15].description_1,
      desbc01l1: _listData[16].description_1,
      desbc02l1: _listData[17].description_1,
      desbf02l1: _listData[18].description_1,
      desfn02l1: _listData[19].description_1,
      desbf03l1: _listData[20].description_1,
      desfn03l1: _listData[21].description_1,
      desbf04l1: _listData[22].description_1,
      desfn04l1: _listData[23].description_1,
      desbf05l1: _listData[24].description_1,
      desfn05l1: _listData[25].description_1,
      desbf06l1: _listData[26].description_1,
      desfn06l1: _listData[27].description_1,
      dessc01l1: _listData[28].description_1,
      dessc02l1: _listData[29].description_1,
      dessc03l1: _listData[30].description_1,
      desbe01l1: _listData[31].description_1,
      desbm01l1: _listData[32].description_1,
      deslq01l1: _listData[33].description_1,
      deslq02l1: _listData[34].description_1,
      dessr01l1: _listData[35].description_1,
      desbf01l1: _listData[36].description_1,
      desfn01l1: _listData[37].description_1,
      desrf01l1: _listData[38].description_1,

      // Line 2
      desbf07l2: _listData[0].description_2,
      desfn07l2: _listData[1].description_2,
      desbf08l2: _listData[2].description_2,
      desfn08l2: _listData[3].description_2,
      desbf09l2: _listData[4].description_2,
      desfn09l2: _listData[5].description_2,
      desbf10l2: _listData[6].description_2,
      desfn10l2: _listData[7].description_2,
      desng01l2: _listData[8].description_2,
      desng02l2: _listData[9].description_2,
      desng03l2: _listData[10].description_2,
      desng04l2: _listData[11].description_2,
      deswf01l2: _listData[12].description_2,
      deswf02l2: _listData[13].description_2,
      deswf03l2: _listData[14].description_2,
      deswf04l2: _listData[15].description_2,
      desbc01l2: _listData[16].description_2,
      desbc02l2: _listData[17].description_2,
      desbf02l2: _listData[18].description_2,
      desfn02l2: _listData[19].description_2,
      desbf03l2: _listData[20].description_2,
      desfn03l2: _listData[21].description_2,
      desbf04l2: _listData[22].description_2,
      desfn04l2: _listData[23].description_2,
      desbf05l2: _listData[24].description_2,
      desfn05l2: _listData[25].description_2,
      desbf06l2: _listData[26].description_2,
      desfn06l2: _listData[27].description_2,
      dessc01l2: _listData[28].description_2,
      dessc02l2: _listData[29].description_2,
      dessc03l2: _listData[30].description_2,
      desbe01l2: _listData[31].description_2,
      desbm01l2: _listData[32].description_2,
      deslq01l2: _listData[33].description_2,
      deslq02l2: _listData[34].description_2,
      dessr01l2: _listData[35].description_2,
      desbf01l2: _listData[36].description_2,
      desfn01l2: _listData[37].description_2,
      desrf01l2: _listData[38].description_2,
    );

    await DatabaseMill.instance
        .create(table: tableMill, mill: inputToDatasbe.toJson());
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
