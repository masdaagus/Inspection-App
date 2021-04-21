import 'package:flutter/cupertino.dart';

final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// add fields
    id, isImportant, number, tittle, description, time
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String tittle = 'tittle';
  static final String description = 'description';
  static final String time = 'time';
}

class Note {
  final int id;
  final bool isImportant;
  final int number;
  final String tittle;
  final String description;
  final DateTime createdTime;

  const Note({
    this.id,
    @required this.isImportant,
    @required this.number,
    @required this.tittle,
    @required this.description,
    @required this.createdTime,
  });

  Note copy({
    int id,
    bool isImportant,
    int number,
    String tittle,
    String description,
    DateTime createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        tittle: tittle ?? this.tittle,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Note fromJson(Map<String, Object> json) => Note(
        id: json[NoteFields.id] as int,
        isImportant: json[NoteFields.isImportant] == 1,
        number: json[NoteFields.number] as int,
        tittle: json[NoteFields.tittle] as String,
        description: json[NoteFields.description] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );

  Map<String, Object> toJson() => {
        NoteFields.id: id,
        NoteFields.tittle: tittle,
        NoteFields.isImportant: isImportant ? 1 : 0,
        NoteFields.number: number,
        NoteFields.description: description,
        NoteFields.time: createdTime.toIso8601String(),
      };
}
