import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../data.dart';
import 'tes.dart';

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
                                      builder: (context) => DetailsPage()));
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
                                // Transform.scale(
                                //     scale: .8,
                                //     child: Checkbox(
                                //         value: detailsLine1[index],
                                //         onChanged: (bool val) {
                                //           setState(() {
                                //             detailsLine1[index] =
                                //                 !detailsLine1[index];
                                //           });
                                //         })),
                                // Transform.scale(
                                //     scale: .8,
                                //     child: Checkbox(
                                //         value: detailsLine2[index],
                                //         onChanged: (bool val) {
                                //           setState(() {
                                //             detailsLine2[index] =
                                //                 !detailsLine2[index];
                                //           });
                                //         })),
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
