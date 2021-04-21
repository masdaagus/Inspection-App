// import 'package:Inspection/data/data.dart';
import 'package:Inspection/data/data2.dart';
import 'package:Inspection/views/details_screen/home.dart';
import 'package:Inspection/views/penampung_database/hasil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../models/data_model.dart';

// ignore: must_be_immutable
class HomeListScreen extends StatelessWidget {
  List<Data> _bismillah = [];

  List<IsiData> _isiData = [];
  void _tambahData(dynamic value) {
    _isiData.add(value);
  }
  // List<String> _masda = [];
  // List<String> _listt = [];

  // void _checkdata(String item) {
  //   if (!_masda.contains(item)) {
  //     _masda.add(item);
  //   } else {
  //     _masda.remove(item);
  //   }
  // }

  // void _ambilData(String item) {
  //   _listt.add(item);
  // }

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Penampung(),
                      ),
                    );
                  },
                  child: Icon(Icons.edit)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print("=" * 20);
                  // print(_susu);
                  // print(_bismillah);
                  _bismillah.forEach((data) {
                    print("${data.data[0].code}   ${data.data[0].statusLine1}");
                  });

                  // print(_listt);
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
                    future: fetchData2(context),
                    builder: (context, snapshot) {
                      // _susu = snapshot.data;
                      _bismillah = snapshot.data;
                      if (snapshot.data == null) {
                        return Container(
                            child: Center(child: Text("Loading...")));
                      } else {
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              Data data = snapshot.data[index];
                              IsiData masda = snapshot.data[index].data[0];

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
                                        masda.equipments,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Text(
                                        masda.checkpoints,
                                      ),
                                      tileColor: Colors.grey[300],
                                      leading: Text(
                                        "\t4#6\n${masda.code}",
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
                                                    value: masda.statusLine1,
                                                    onChanged: (value) {
                                                      provider.tesbox(masda
                                                          .statusLine1 = value);
                                                      print('Line - 1');
                                                      print(masda.code +
                                                          ' - ' +
                                                          masda.statusLine1
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
                                                  value: masda.statusLine2,
                                                  onChanged: (value) {
                                                    provider.tesbox(masda
                                                        .statusLine2 = value);
                                                    print('Line - 2');
                                                    print(masda.code +
                                                        ' - ' +
                                                        masda.statusLine2
                                                            .toString());
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

  Widget iconSlide(Data data, BuildContext context) {
    IsiData masda = data.data[0];
    return IconSlideAction(
      caption: 'Remarks',
      color: Colors.grey,
      icon: Icons.edit,
      onTap: () {
        print("Selectd ${masda.code}");
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
