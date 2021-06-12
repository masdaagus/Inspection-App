import 'package:Inspection/Database/database_mill.dart';
import 'package:Inspection/details_history/details_history.dart';
import 'package:Inspection/model_database/check_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListHistory extends StatelessWidget {
  final f = new DateFormat('dd-MM-yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
            future: DatabaseMill.instance.readAllNotes(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(child: Center(child: Text("Loading...")));
              } else {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Check mill = snapshot.data[index];
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailHistory(
                                          idMill: mill.id,
                                        )));
                          },
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          title: Text(f.format(mill.createTime),
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          leading: Text(mill.line.toString(),
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 11)),
                          tileColor: Colors.grey[300],
                          subtitle: Text(mill.description_bf08),
                          dense: true,
                        ),
                        Divider(height: 1, color: Colors.black),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
