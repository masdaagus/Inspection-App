import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MathCalculation extends GetxController {
  TextEditingController feed = TextEditingController(text: '0');
  TextEditingController percent;
  TextEditingController berat;
  TextEditingController t1;
  TextEditingController t2;
  TextEditingController t3;

  double f = 0;
  double p = 0;
  double s = 0;
  double actwf = 0;
  double error = 0;

  double _avarage;
  double _actualWf;
  double _setPoint;

  double get setPoint => _setPoint;
  double get avarage => _avarage;
  double get weight => double.tryParse(berat.text);

  @override
  void onInit() {
    super.onInit();
    t1 = TextEditingController();
    t2 = TextEditingController();
    t3 = TextEditingController();
    feed = TextEditingController();
    percent = TextEditingController();
    berat = TextEditingController();
  }

  @override
  void onClose() {
    t1.dispose();
    t2.dispose();
    t3.dispose();
    feed.dispose();
    percent.dispose();
    berat.dispose();
    super.onClose();
  }

  void all() {
    _avrg();
    _stp();
    _actual();
    _error();
    f = double.tryParse(feed.text);
    p = double.tryParse(percent.text);
    s = _setPoint;
    actwf = _actualWf;

    update();
    return;
  }

  double _actual() {
    double _berat = double.tryParse(berat.text);
    _actualWf = (1.0 / _avarage) * 3600 * _berat / 1000;
    return _actualWf;
  }

  double _stp() {
    double _f = double.tryParse(feed.text);
    double _p = double.tryParse(percent.text);
    _setPoint = _f * _p / 100;
    update();
    return _setPoint;
  }

  double _avrg() {
    double _sum = double.tryParse(t1.text) +
        double.tryParse(t2.text) +
        double.tryParse(t3.text);
    _avarage = _sum / 3;
    update();
    return _avarage;
  }

  double _error() {
    error = (_actualWf - _setPoint) / _setPoint * 100;
    return error;
  }

  final selected = '1'.obs;
  final List<String> lines = ['1', '2'];

  void setLine(String val) {
    selected.value = val;
    update();
  }

  final material = 'Clinker'.obs;
  final List<String> materials = ['Clinker', 'Trass', 'Limestone', 'Gypsum'];
  void setMaterial(String val) {
    material.value = val;
    update();
  }
}
