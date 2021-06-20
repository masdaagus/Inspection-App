import 'package:Inspection/Database/database_mill.dart';
import 'package:Inspection/model_database/mill_model.dart';
import 'package:Inspection/views/const/const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../tes.dart';

class ListHistory extends StatelessWidget {
  final f = new DateFormat('dd-MM-yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColor,
      appBar: AppBar(
        backgroundColor: bagroundColor,
        title: Text("List History"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffced4da)),
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
                    Mill mill = snapshot.data[index];
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
                          leading: Text(mill.id.toString(),
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 11)),
                          tileColor: Colors.grey[300],
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
