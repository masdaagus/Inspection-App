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
    this.line1,
    this.line2,
  });

  String code;
  String equipments;
  String checkpoints;
  bool line1;
  bool line2;

  factory DataMill.fromJson(Map<String, dynamic> json) => DataMill(
        code: json["code"],
        equipments: json["equipments"],
        checkpoints: json["checkpoints"],
        line1: json["statusLine1"],
        line2: json["statusLine2"],
      );

  // get statusLine1 => null;

  Map<String, dynamic> toJson() => {
        "code": code,
        "equipments": equipments,
        "checkpoints": checkpoints,
      };
}

Future<List<DataMill>> fetchData(BuildContext context) async {
  final jsonString =
      await DefaultAssetBundle.of(context).loadString("assets/data/data.json");
  return detailsDataFromJson(jsonString);
}
