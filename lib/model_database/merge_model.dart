import 'package:flutter/cupertino.dart';

class MergeFields {
  static final List<String> valueMerge = [id, time, line1, line2];

  static final String id = '_id';
  static final String time = 'time';
  static final String line1 = 'line1';
  static final String line2 = 'line2';
}

class Merge {
  final int id;
  final DateTime createTime;
  final int line1;
  final int line2;
  const Merge({
    this.id,
    @required this.createTime,
    this.line1,
    this.line2,
  });

  static Merge fromJson(Map<String, Object> json) => Merge(
      id: json[MergeFields.id] as int,
      createTime: DateTime.parse(json[MergeFields.time] as String),
      line1: json[MergeFields.id] as int,
      line2: json[MergeFields.id] as int);

  Map<String, Object> toJson() => {
        MergeFields.id: id,
        MergeFields.time: createTime.toIso8601String(),
        MergeFields.line1: line1,
        MergeFields.line2: line2
      };
}
