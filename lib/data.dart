import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

List<DetailsData> detailsDataFromJson(String str) => List<DetailsData>.from(
    json.decode(str).map((x) => DetailsData.fromJson(x)));

class DetailsData {
  DetailsData({
    this.code,
    this.equipments,
    this.checkpoints,
  });

  final String code;
  final String equipments;
  final String checkpoints;

  factory DetailsData.fromJson(Map<String, dynamic> json) => DetailsData(
        code: json["code"],
        equipments: json["equipments"],
        checkpoints: json["checkpoints"],
      );
}

var detailsLine1 = List<bool>();
var detailsLine2 = List<bool>();

Future<String> _loadFromAsset() async {
  String jsonString = await rootBundle.loadString("assets/data/data.json");
}

// final String masda = await _loadFromAsset();
Future<List<DetailsData>> parseJson() async {
  String jsonString = await _loadFromAsset();
  final jsonData = json.decode(jsonString);
  DetailsData datas = DetailsData.fromJson(jsonData);
}
