import 'package:flutter/material.dart';
import 'package:Inspection/data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'tes.dart';

class DataListView extends StatelessWidget {
  final json = parseJson();

  List<DetailsData> masda;
  DataListView({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
        future: json,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(child: Center(child: Text("Loading...")));
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Slidable(
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'Remarks',
                            color: Colors.grey,
                            icon: Icons.edit,
                            onTap: () {
                              print("Selectd ${snapshot.data[index].code}");

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Scaffold(
                              //       body: Center(
                              //         child: Text(
                              //           snapshot.data[index].code,
                              //           style: TextStyle(
                              //               fontSize: 32,
                              //               fontWeight: FontWeight.bold),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // );

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
                            snapshot.data[index].subtittle,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            snapshot.data[index].tittle,
                          ),
                          tileColor: Colors.grey[300],
                          leading: Text(
                            "\t4#6\n${snapshot.data[index].code}",
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
                                        value: detailsLine1[index],
                                        onChanged: (bool val) {
                                          // setState(() {
                                          //   detailsLine1[index] =
                                          //       !detailsLine1[index];
                                          // });
                                        })),
                                Transform.scale(
                                    scale: .8,
                                    child: Checkbox(
                                        value: detailsLine2[index],
                                        onChanged: (bool val) {
                                          // setState(() {
                                          //   detailsLine2[index] =
                                          //       !detailsLine2[index];
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
