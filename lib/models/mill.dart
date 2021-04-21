import 'package:flutter/cupertino.dart';

final String tableMill = 'mill';

class MillFields {
  static final String id = '_id';
  static final String lineSatu = 'lineSatu';
  static final String lineDua = 'lineDua';
  static final String time = 'time';
  static final String description = 'description';
}

class Mill {
  final int id;
  final bool lineSatu;
  final bool lineDua;
  final DateTime createdTime;
  final String description;

  const Mill({
    this.id,
    @required this.lineSatu,
    @required this.lineDua,
    @required this.createdTime,
    @required this.description,
  });

  static Mill fromJson(Map<String, Object> json) => Mill(
        id: json[MillFields.id] as int,
        lineSatu: json[MillFields.lineSatu] == 1,
        lineDua: json[MillFields.lineDua] == 1,
        createdTime: DateTime.parse(json[MillFields.time] as String),
        description: json[MillFields.description] as String,
      );

  Map<String, Object> toJson() => {
        MillFields.id: id,
        MillFields.lineSatu: lineSatu ? 1 : 2,
        MillFields.lineDua: lineDua ? 1 : 2,
        MillFields.time: createdTime.toIso8601String(),
      };
}
