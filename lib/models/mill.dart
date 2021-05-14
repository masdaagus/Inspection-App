import 'package:flutter/cupertino.dart';

final String tableMill = 'mill';

class MillFields {
  static final List<String> values = [
    id,
    lineSatu,
  ];

  static final String id = '_id';
  static final String lineSatu = 'lineSatu';
  // static final String lineDua = 'lineDua';
}

class Mill {
  final int id;
  final List lineSatu;
  // final List lineDua;

  const Mill({
    this.id,
    @required this.lineSatu,
    // @required this.lineDua,
  });

  static Mill fromJson(Map<String, Object> json) => Mill(
        id: json[MillFields.id] as int,
        lineSatu: json[MillFields.lineSatu],
        // lineDua: json[MillFields.lineDua] as List
        // description: json[MillFields.description] as String,
        // createdTime: DateTime.parse(json[MillFields.time] as String),
      );

  Map<String, Object> toJson() => {
        MillFields.id: id,
        MillFields.lineSatu: lineSatu,
        // MillFields.lineDua: lineDua
        // MillFields.lineSatu: lineSatu ? 1 : 2,
        // MillFields.lineDua: lineDua ? 1 : 2,
        // MillFields.time: createdTime.toIso8601String(),
      };

  Mill copy({
    int id,
    List lineSatu,
    // List lineDua,
  }) =>
      Mill(
        id: id ?? this.id,
        lineSatu: lineSatu ?? this.lineSatu,
        // lineDua: lineDua ?? this.lineDua,
      );
}
