import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model.dart';

// ignore: camel_case_types
class buildResult extends StatefulWidget {
  const buildResult({
    Key key,
  }) : super(key: key);

  @override
  _buildResultState createState() => _buildResultState();
}

final feed = TextEditingController();
final percent = TextEditingController();
final weight = TextEditingController();
final timer1 = TextEditingController();
final timer2 = TextEditingController();
final timer3 = TextEditingController();

double _setPoint = 0;
double _avarage = 0;
double _aktualWf = 0;
double _error = 0;

final formater = NumberFormat("##.##");
DateTime now = DateTime.now();

// ignore: camel_case_types
class _buildResultState extends State<buildResult> {
  // This is for pick the date and the materials

  List<MaterialCemen> _materials = MaterialCemen.getMaterials();
  List<DropdownMenuItem<MaterialCemen>> _dropdownMenuItems;
  MaterialCemen _selectedMaterial;

  List<LineMill> _lines = LineMill.getLines();
  List<DropdownMenuItem<LineMill>> _droplineMenuItems;
  LineMill _selectedLine;

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItem(_materials);
    _selectedMaterial = _dropdownMenuItems[0].value;
    _droplineMenuItems = buildDroplineMenuItem(_lines);
    _selectedLine = _droplineMenuItems[0].value;
  }

  List<DropdownMenuItem<MaterialCemen>> buildDropdownMenuItem(List materials) {
    List<DropdownMenuItem<MaterialCemen>> items = [];
    for (MaterialCemen material in materials) {
      items.add(DropdownMenuItem(
        value: material,
        child: Text(material.name),
      ));
    }
    return items;
  }

  List<DropdownMenuItem<LineMill>> buildDroplineMenuItem(List lines) {
    List<DropdownMenuItem<LineMill>> items = [];
    for (LineMill line in lines) {
      items.add(DropdownMenuItem(
        value: line,
        child: Text(line.name),
      ));
    }
    return items;
  }

  onChangeDropdownItem(MaterialCemen selectedMaterial) {
    setState(() {
      _selectedMaterial = selectedMaterial;
    });
  }

  onChangeDroplineItem(LineMill selectedLine) {
    setState(() {
      _selectedLine = selectedLine;
    });
  }

  double setPoint() {
    setState(() {
      double mas1 = double.tryParse(feed.text);
      double mas2 = double.tryParse(percent.text);

      _setPoint = mas1 * mas2 / 100;
    });
    return _setPoint;
  }

  double avarage() {
    setState(() {
      double t1 = double.tryParse(timer1.text);
      double t2 = double.tryParse(timer2.text);
      double t3 = double.tryParse(timer3.text);
      _avarage = (t1 + t2 + t3) / 3;
    });
    return _avarage;
  }

  double aktualWf() {
    setState(() {
      double berat = double.tryParse(weight.text);
      _aktualWf = (1 / _avarage) * 3600 * berat / 1000;
    });
    return _aktualWf;
  }

  double error() {
    setState(() {
      _error = (_aktualWf - _setPoint) / _setPoint * 100;
    });
    return _error;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 260,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFB0BEC5),
                  Color(0xFF78909C),
                  Color(0xFF546E7A),
                  Color(0xFF455A64),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          _selectedLine.name,
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "${now.day}" +
                              "-" +
                              "${now.month}" +
                              "-" +
                              "${now.year}",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          '${_selectedMaterial.name}',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Feedeng: " + feed.text + "t/h",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Percentage: " + percent.text + " %",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "SetPoint: " + formater.format(_setPoint),
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 19),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "Timer: " + formater.format(_avarage),
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueGrey[200]),
                          child: Center(
                              child: Text(
                            formater.format(_error) + "%",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "Weight :" + weight.text,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  "ERROR",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                SizedBox(height: 16),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Actual Weighfeeder",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                      SizedBox(height: 3),
                      Text(
                        formater.format(_aktualWf),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Center(
            child: Text(
              'Devolved By Group A Production',
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ),
          // margin: EdgeInsets.only(top: 288), // default is 260
          height: 30,
          decoration: BoxDecoration(
              color: Colors.blueGrey[800],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        SizedBox(height: 5),
        // ini dari input result
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 230,
              width: 160,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFB0BEC5),
                      Color(0xFF78909C),
                      Color(0xFF546E7A),
                      Color(0xFF455A64),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 5),
                  Text(
                    "Data CCR",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 18),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 40, left: 40),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              setPoint();
                              avarage();
                              aktualWf();
                              error();
                            });
                          },
                          controller: feed,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "Feed",
                              hintStyle: TextStyle(fontSize: 13)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40, left: 40),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              setPoint();
                              avarage();
                              aktualWf();
                              error();
                            });
                          },
                          controller: percent,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "Percent",
                              hintStyle: TextStyle(fontSize: 13)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40, left: 40),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              setPoint();
                              avarage();
                              aktualWf();
                              error();
                            });
                          },
                          controller: weight,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "Weight",
                              hintStyle: TextStyle(fontSize: 13)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 230,
              width: 160,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFB0BEC5),
                      Color(0xFF78909C),
                      Color(0xFF546E7A),
                      Color(0xFF455A64),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                  // color: Colors.red[50],
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 5),
                  Text(
                    "Timer",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 18),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 40, left: 40),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              setPoint();
                              avarage();
                              aktualWf();
                              error();
                            });
                          },
                          controller: timer1,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "Time-1",
                              hintStyle: TextStyle(fontSize: 13)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40, left: 40),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              setPoint();
                              avarage();
                              aktualWf();
                              error();
                            });
                          },
                          controller: timer2,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "Time-2",
                              hintStyle: TextStyle(fontSize: 13)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40, left: 40),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              setPoint();
                              avarage();
                              aktualWf();
                              error();
                            });
                          },
                          controller: timer3,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "Time-3",
                              hintStyle: TextStyle(fontSize: 13)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownButton(
              style: TextStyle(fontSize: 12, color: Colors.black),
              items: _droplineMenuItems,
              onChanged: onChangeDroplineItem,
              value: _selectedLine,
              underline: Container(
                color: Colors.transparent,
              ),
              iconSize: 0,
            ),
            DropdownButton(
              style: TextStyle(fontSize: 12, color: Colors.black),
              items: _dropdownMenuItems,
              onChanged: onChangeDropdownItem,
              value: _selectedMaterial,
            )
          ],
        )
      ],
    );
  }
}
