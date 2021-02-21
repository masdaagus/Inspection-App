import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:convert';

import '../../../data.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
        future: parseJson(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(
                      child: Text(
                    "${snapshot.data[index].code}",
                    style: TextStyle(),
                  )),
                );
              });
        },
      ),
    );
  }
}
