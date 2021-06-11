import 'dart:convert';
import 'package:flutter/cupertino.dart';

List<DataMill> detailsDataFromJson(String str) =>
    List<DataMill>.from(json.decode(str).map((x) => DataMill.fromJson(x)));

String detailsDataToJson(List<DataMill> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataMill {
  DataMill({
    this.code,
    this.equipments,
    this.checkpoints,
    this.checklist_1,
    this.checklist_2,
    this.description_1,
    this.description_2,
    this.line,
  });

  final String code;
  final String equipments;
  final String checkpoints;
  bool checklist_1;
  bool checklist_2;
  String description_1;
  String description_2;
  final String line;

  factory DataMill.fromJson(Map<String, dynamic> json) => DataMill(
        code: json["code"],
        equipments: json["equipments"],
        checkpoints: json["checkpoints"],
        checklist_1: json["checklis_1"],
        checklist_2: json["checklis_2"],
        description_1: json["description_1"],
        description_2: json["description_2"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "equipments": equipments,
        "checkpoints": checkpoints,
        "description_1": description_1,
        "description_2": description_2,
      };
}

Future<List<DataMill>> fetchData(BuildContext context) async {
  final jsonString =
      await DefaultAssetBundle.of(context).loadString("assets/data/data.json");
  return detailsDataFromJson(jsonString);
}
