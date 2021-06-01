import 'package:Inspection/Database/database_mill.dart';
import 'package:Inspection/models/mill_model.dart';
import 'package:flutter/material.dart';

class Bismillah extends StatelessWidget {
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
                    Mill mill = snapshot.data[index];
                    return ListTile(
                        title: Text(mill.id.toString()),
                        subtitle: Text("BF-07 =  " +
                            mill.bf07.toString() +
                            " & " +
                            mill.fn07.toString()));
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
