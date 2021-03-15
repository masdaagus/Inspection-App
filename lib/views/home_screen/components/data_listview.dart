import 'package:Inspection/views/home_screen/components/componen/button.dart';
import 'package:Inspection/views/home_screen/components/detail_page.dart';
import 'package:Inspection/views/home_screen/models/dataModel.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/data.dart';

class DataListView extends StatelessWidget {
  DataListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    print("Update listview page");
    return Material(
      color: Colors.grey[300],
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildText("Code"),
                    SizedBox(width: size.width * .30),
                    buildText("Equipments"),
                    SizedBox(width: size.width * .18),
                    Row(
                      children: [
                        buildText("#1"),
                        SizedBox(width: size.width * .08),
                        buildText("#2"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: .5,
                width: double.infinity,
                color: Colors.black,
              ),

              FutureBuilder(
                future: fetchData(context),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container(child: Center(child: Text("Loading...")));
                  } else {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          DetailsData data = snapshot.data[index];

                          return Column(
                            children: [
                              Column(
                                children: [
                                  Slidable(
                                    secondaryActions: <Widget>[
                                      IconSlideAction(
                                        caption: 'Remarks',
                                        color: Colors.grey,
                                        icon: Icons.edit,
                                        onTap: () {
                                          print("Selectd ${data.code}");
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DemoDetailsPage(
                                                        data: data,
                                                      )));
                                        },
                                      ),
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
                                            Transform.scale(
                                                scale: .8,
                                                child: Consumer<DataModel>(
                                                  builder:
                                                      (context, model, _) =>
                                                          Checkbox(
                                                    value:
                                                        model.isSelected1(data),
                                                    onChanged: (value) {
                                                      provider.check1(data);
                                                      var mas = model
                                                          .isSelected1(data);
                                                      print('Line - 1');
                                                      print(mas);
                                                      print('=' * 10);
                                                    },
                                                  ),
                                                )),
                                            Transform.scale(
                                                scale: .8,
                                                child: Consumer<DataModel>(
                                                  builder:
                                                      (context, model, _) =>
                                                          Checkbox(
                                                    value:
                                                        model.isSelected2(data),
                                                    onChanged: (value) {
                                                      provider.check2(data);
                                                      var mas = model
                                                          .isSelected2(data);
                                                      print(data.code);
                                                      print('Line - 2');
                                                      print(mas);
                                                      print('=' * 10);
                                                    },
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                      dense: true,
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          );
                        });
                  }
                },
              ),
              SizedBox(height: 5),
              // button(
              //     tittle: 'Save',
              //     onpress: () {
              //       print("press save button");
              //     },
              //     width: MediaQuery.of(context).size.width * .6,
              //     height: 40,
              //     fontsize: 18),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Text buildText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}
