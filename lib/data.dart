import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

var detailsLine1 = List<bool>();
var detailsLine2 = List<bool>();

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
    detailsLine1.add(false);
    detailsLine2.add(false);
  }
  return details;
  print(details);
}

class DetailsData {
  final String code;
  final String tittle;
  final String subtittle;

  DetailsData(
    this.code,
    this.subtittle,
    this.tittle,
  );
}
