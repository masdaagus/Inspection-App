import 'package:Inspection/views/home_screen/components/detail_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import '../../../data.dart';

class DataListView extends StatefulWidget {
  DataListView({
    Key key,
  }) : super(key: key);

  @override
  _DataListViewState createState() => _DataListViewState();
}

class _DataListViewState extends State<DataListView> {
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
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
                            data.code,
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
                                    child: Checkbox(
                                        value: data.line1,
                                        onChanged: (bool val) {
                                          setState(() {
                                            data.line1 = val;
                                          });
                                        })),
                                Transform.scale(
                                    scale: .8,
                                    child: Checkbox(
                                        value: data.line2,
                                        onChanged: (bool val) {
                                          setState(() {
                                            data.line2 = val;
                                          });
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
