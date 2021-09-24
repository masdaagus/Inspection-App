// To parse this JSON data, do
//
//     final detailsData = detailsDataFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/cupertino.dart';

List<DataPacker> detailsDataFromJson(String str) =>
    List<DataPacker>.from(json.decode(str).map((x) => DataPacker.fromJson(x)));

String detailsDataToJson(List<DataPacker> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataPacker {
  DataPacker({
    this.code,
    this.equipments,
    this.checkpoints,
    this.checklist_1,
    this.checklist_2,
    this.checklist_3,
    this.description_1,
    this.description_2,
    this.description_3,
  });

  final String code;
  final String equipments;
  final String checkpoints;
  bool checklist_1;
  bool checklist_2;
  bool checklist_3;
  String description_1;
  String description_2;
  String description_3;

  factory DataPacker.fromJson(Map<String, dynamic> json) => DataPacker(
        code: json["code"],
        equipments: json["equipments"],
        checkpoints: json["checkpoints"],
        checklist_1: json["checklis_1"],
        checklist_2: json["checklis_2"],
        checklist_3: json["checklis_3"],
        description_1: json["description_1"],
        description_2: json["description_2"],
        description_3: json["description_3"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "equipments": equipments,
        "checkpoints": checkpoints,
        "checklis_1": checklist_1,
        "checklis_2": checklist_2,
        "checklis_3": checklist_3,
        "description_1": description_1,
        "description_2": description_2,
        "description_3": description_3,
      };
}

Future<List<DataPacker>> fetchData2(BuildContext context) async {
  final jsonString = await DefaultAssetBundle.of(context)
      .loadString("assets/data/data_packer.json");
  return detailsDataFromJson(jsonString);
}

Future<List<DataPacker>> fetchData1(BuildContext context) async {
  final jsonString = await DefaultAssetBundle.of(context)
      .loadString("assets/data/special_packer.json");
  return detailsDataFromJson(jsonString);
}
