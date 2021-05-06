// import 'dart:convert';
// import 'package:flutter/cupertino.dart';

// List<DetailsData> detailsDataFromJson(String str) => List<DetailsData>.from(
//     json.decode(str).map((x) => DetailsData.fromJson(x)));

// String detailsDataToJson(List<DetailsData> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class DetailsData {
//   DetailsData({
//     this.code,
//     this.equipments,
//     this.checkpoints,
//     this.line1,
//     this.line2,
//   });

//   String code;
//   String equipments;
//   String checkpoints;
//   bool line1;
//   bool line2;

//   factory DetailsData.fromJson(Map<String, dynamic> json) => DetailsData(
//         code: json["code"],
//         equipments: json["equipments"],
//         checkpoints: json["checkpoints"],
//         line1: json["statusLine1"],
//         line2: json["statusLine2"],
//       );

//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "equipments": equipments,
//         "checkpoints": checkpoints,
//       };
// }

// Future<List<DetailsData>> fetchData(BuildContext context) async {
//   final jsonString =
//       await DefaultAssetBundle.of(context).loadString("assets/data/data.json");
//   return detailsDataFromJson(jsonString);
// }
