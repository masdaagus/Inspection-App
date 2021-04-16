// To parse this JSON data, do
//
//     final detailsData = detailsDataFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<TesDataa> detailsDataFromMap(String str) =>
    List<TesDataa>.from(json.decode(str).map((x) => TesDataa.fromMap(x)));

String detailsDataToMap(List<TesDataa> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class TesDataa {
  TesDataa({
    this.id,
    this.data,
  });

  final int id;
  final List<IntiData> data;

  factory TesDataa.fromMap(Map<String, dynamic> json) => TesDataa(
        id: json["id"],
        data: List<IntiData>.from(json["data"].map((x) => IntiData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class IntiData {
  IntiData({
    this.code,
    this.equipments,
    this.checkpoints,
    this.statusLine1,
    this.statusLine2,
  });

  final String code;
  final String equipments;
  final String checkpoints;
  final bool statusLine1;
  final bool statusLine2;

  factory IntiData.fromMap(Map<String, dynamic> json) => IntiData(
        code: json["code"],
        equipments: json["equipments"],
        checkpoints: json["checkpoints"],
        statusLine1: json["statusLine1"],
        statusLine2: json["statusLine2"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "equipments": equipments,
        "checkpoints": checkpoints,
        "statusLine1": statusLine1,
        "statusLine2": statusLine2,
      };
}

Future<List<TesDataa>> fetchData2(BuildContext context) async {
  final jsonString =
      await DefaultAssetBundle.of(context).loadString("assets/data/data2.json");
  return detailsDataFromMap(jsonString);
}
