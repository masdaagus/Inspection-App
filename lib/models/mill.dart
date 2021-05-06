import 'package:flutter/cupertino.dart';

final String tableMill = 'mill';

class MillFields {
  static final List<String> values = [
    id,
    lineSatu,
    lineDua,
  ];

  static final String id = '_id';
  static final String lineSatu = 'lineSatu';
  static final String lineDua = 'lineDua';
  // static final String description = 'description';
  // static final String time = 'time';
}

class Mill {
  final int id;
  final List lineSatu;
  final List lineDua;
  // final String description;
  // final DateTime createdTime;

  const Mill({
    this.id,
    @required this.lineSatu,
    @required this.lineDua,
    // @required this.description,
    // @required this.createdTime,
  });

  static Mill fromJson(Map<String, Object> json) => Mill(
      id: json[MillFields.id] as int,
      lineSatu: json[MillFields.lineSatu] as List,
      lineDua: json[MillFields.lineDua] as List
      // description: json[MillFields.description] as String,
      // createdTime: DateTime.parse(json[MillFields.time] as String),
      );

  Map<String, Object> toJson() => {
        MillFields.id: id,
        MillFields.lineSatu: lineSatu,
        MillFields.lineDua: lineDua
        // MillFields.lineSatu: lineSatu ? 1 : 2,
        // MillFields.lineDua: lineDua ? 1 : 2,
        // MillFields.time: createdTime.toIso8601String(),
      };

  Mill copy({
    int id,
    List lineSatu,
    List lineDua,
  }) =>
      Mill(
        id: id ?? this.id,
        lineSatu: lineSatu ?? this.lineSatu,
        lineDua: lineDua ?? this.lineDua,
      );
}
