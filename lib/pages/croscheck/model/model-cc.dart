import 'package:flutter/cupertino.dart';

class CrossCheckInput {
  static const String userName = 'userName';
  static const String idUser = 'IDUSER';
  static const String shift = 'SHIFT';
  static const String time = 'time';

  static const String line = 'line';
  static const String material = 'material';
  static const String feeding = 'feeding';
  static const String percentage = 'percentage';
  static const String setPoint = 'setPoint';
  static const String weight = 'weight';
  static const String timer = 'timer';
  static const String actualWf = 'actualWf';
  static const String error = 'error';
}

class CrossCheck {
  final String userName;
  final String idUser;
  final String shift;
  final String time;
  final String line;
  final String material;
  final double feeding;
  final double percentage;
  final double setPoint;
  final double weight;
  final double timer;
  final double actualWf;
  final double error;

  const CrossCheck({
    @required this.userName,
    @required this.idUser,
    @required this.shift,
    @required this.time,
    @required this.line,
    @required this.material,
    @required this.feeding,
    @required this.percentage,
    @required this.setPoint,
    @required this.weight,
    @required this.timer,
    @required this.actualWf,
    @required this.error,
  });

  Map<String, Object> toJson() => {
        CrossCheckInput.userName: userName,
        CrossCheckInput.idUser: idUser,
        CrossCheckInput.shift: shift,
        CrossCheckInput.time: time,
        CrossCheckInput.line: line,
        CrossCheckInput.material: material,
        CrossCheckInput.feeding: feeding,
        CrossCheckInput.percentage: percentage,
        CrossCheckInput.setPoint: setPoint,
        CrossCheckInput.weight: weight,
        CrossCheckInput.timer: timer,
        CrossCheckInput.actualWf: actualWf,
        CrossCheckInput.error: error,
      };
}
