import 'package:Inspection/data/data.dart';
import 'package:Inspection/views/details_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../../models/data_model.dart';

class HomeListScreen extends StatelessWidget {
  List<String> _masda = [];

  void _checkdata(String item) {
    if (!_masda.contains(item)) {
      _masda.add(item);
    } else {
      _masda.remove(item);
    }
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
              child: Icon(Icons.edit),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print("=" * 20);
                  print(_masda.length);
                  print("=" * 20);
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
                      if (snapshot.data == null) {
                        return Container(
                            child: Center(child: Text("Loading...")));
                      } else {
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              DetailsData data = snapshot.data[index];

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

                                                      _checkdata(data.code);

                                                      print('Line - 1');

                                                      print(data.code +
                                                          ' - ' +
                                                          data.line1
                                                              .toString());

                                                      print('=' * 10);
                                                    },
                                                  ),
                                                )),
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
                                                    print(data.code);
                                                    print(value);
                                                    print('=' * 10);
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

  Widget iconSlide(DetailsData data, BuildContext context) {
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

  Text buildText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}
