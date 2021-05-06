import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<Data> detailsDataFromMap(String str) =>
    List<Data>.from(json.decode(str).map((x) => Data.fromMap(x)));

String detailsDataToMap(List<Data> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Data {
  Data({
    this.id,
    this.data,
  });

  final int id;
  final List<IsiData> data;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        data: List<IsiData>.from(json["data"].map((x) => IsiData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class IsiData {
  IsiData({
    this.code,
    this.equipments,
    this.checkpoints,
    this.statusLine1,
    this.statusLine2,
  });

  final String code;
  final String equipments;
  final String checkpoints;
  bool statusLine1;
  bool statusLine2;

  factory IsiData.fromMap(Map<String, dynamic> json) => IsiData(
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

Future<List<Data>> fetchData2(BuildContext context) async {
  final jsonString =
      await DefaultAssetBundle.of(context).loadString("assets/data/data2.json");
  return detailsDataFromMap(jsonString);
}

class Remakrks {
  Remakrks({
    // this.line,
    this.description,
  });

  // bool line;
  final String description;
}
