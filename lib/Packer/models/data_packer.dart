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
    this.checklis1,
    this.checklis2,
    this.checklis3,
    this.description1,
    this.description2,
  });

  final String code;
  final String equipments;
  final String checkpoints;
  bool checklis1;
  bool checklis2;
  bool checklis3;
  String description1;
  String description2;

  factory DataPacker.fromJson(Map<String, dynamic> json) => DataPacker(
        code: json["code"],
        equipments: json["equipments"],
        checkpoints: json["checkpoints"],
        checklis1: json["checklis_1"],
        checklis2: json["checklis_2"],
        checklis3: json["checklis_3"],
        description1: json["description_1"],
        description2: json["description_2"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "equipments": equipments,
        "checkpoints": checkpoints,
        "checklis_1": checklis1,
        "checklis_2": checklis2,
        "checklis_3": checklis3,
        "description_1": description1,
        "description_2": description2,
      };
}

Future<List<DataPacker>> fetchData(BuildContext context) async {
  final jsonString = await DefaultAssetBundle.of(context)
      .loadString("assets/data/data_packer.json");
  return detailsDataFromJson(jsonString);
}
