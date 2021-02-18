import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import '../../../data.dart';

class DetailsPage extends StatelessWidget {
  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/data/data.json");
  }

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);

    List<DetailsData> details = [];

    for (var d in jsonResponse) {
      DetailsData detailsData =
          DetailsData(d["code"], d["equipments"], d["checkpoints"]);
      details.add(detailsData);
    }
    return details;
  }

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
