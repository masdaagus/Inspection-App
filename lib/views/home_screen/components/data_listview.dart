import 'package:Inspection/views/home_screen/components/detail_page.dart';
import 'package:Inspection/views/home_screen/models/dataModel.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/data.dart';
import '../../../tes.dart';

class DataListView extends StatelessWidget {
  DataListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Update listview page");
    return Material(
      child: FutureBuilder(
        future: fetchData(context),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(child: Center(child: Text("Loading...")));
          } else {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  DetailsData data = snapshot.data[index];

                  return Column(
                    children: [
                      Slidable(
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'Remarks',
                            color: Colors.grey,
                            icon: Icons.edit,
                            onTap: () {
                              print("Selectd ${data.code}");
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => DetailPage(
                              //               data: data,
                              //             )));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DemoDetailsPage(
                                            data: data,
                                          )));
                            },
                          ),
                        ],
                        actionExtentRatio: .20,
                        actionPane: SlidableDrawerActionPane(),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 7),
                          title: Text(
                            data.equipments,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            data.checkpoints,
                          ),
                          tileColor: Colors.grey[300],
                          leading: Text(
                            "\t4#6\n${data.code}",
                            style:
                                TextStyle(color: Colors.black45, fontSize: 11),
                          ),
                          trailing: Container(
                            width: 96,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Transform.scale(
                                    scale: .8,
                                    child: Consumer<DataModel>(
                                      builder: (context, model, _) => Checkbox(
                                          value: model.isSelected(data),
                                          onChanged: (value) {
                                            Provider.of<DataModel>(context,
                                                    listen: false)
                                                .check(data);

                                            print(data.code);
                                          }),
                                    )),
                                Transform.scale(
                                    scale: .8,
                                    child: Checkbox(
                                        value: data.line2,
                                        onChanged: (bool val) {
                                          // setState(() {
                                          //   data.line2 = val;
                                          // });
                                        })),
                              ],
                            ),
                          ),
                          dense: true,
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.black,
                      )
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}
