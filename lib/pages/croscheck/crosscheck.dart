import 'package:Inspection/config/method/button_method.dart';
import 'package:Inspection/config/palette.dart';
import 'package:Inspection/controller/controller.dart';
import 'package:Inspection/pages/dashbord/dashbord.dart';
import 'package:Inspection/widgets/header/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/add.dart';
import 'controller/math.dart';
import 'widgets/number-field.dart';
import 'widgets/stopwatch.dart';

class CrossCheck extends StatelessWidget {
  const CrossCheck({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(MathCalculation());
    final controller = Get.put(Controller());
    final ctrl = Get.put(DataController());

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Palette.backgroundColor,
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: Text(
            "Cross Check",
            style: TextStyle(
                fontSize: 20,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white70,
          leading: buttonAppBar(
              icon: Icons.arrow_back_sharp,
              onPress: () {
                final c = Get.put(Method());
                c.dialog(
                    msg: "Apakah anda ingin keluar ?",
                    onTap: () => Get.offAll(Dashbaord()));
              }),
          actions: [
            buttonAppBar(
              icon: Icons.send_and_archive,
              onPress: () => ctrl.addData(),
            )
          ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 5, left: 5, top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                        Color(0xffced4da),
                        Color(0xffE5E5E5),
                      ], begin: Alignment.topRight, end: Alignment.bottomRight),
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Header(),
                        Container(
                          margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xfffff4f1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GetBuilder<MathCalculation>(
                                builder: (cc) {
                                  return Expanded(
                                      flex: 1,
                                      child: textInfo(
                                          "Line ${cc.selected.toString()}"));
                                },
                              ),
                              SizedBox(width: 55),
                              Expanded(
                                  flex: 1,
                                  child: textInfo(f.format(controller.now))),
                              SizedBox(width: 55),
                              GetBuilder<MathCalculation>(
                                builder: (cc) {
                                  return Expanded(
                                      flex: 1,
                                      child: textInfo(cc.material.toString()));
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xfffff4f1).withOpacity(.3)),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GetBuilder<MathCalculation>(
                                    builder: (cc) {
                                      return Expanded(
                                          flex: 1,
                                          child: fps("Feeding: ${cc.f} t/h"));
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  GetBuilder<MathCalculation>(
                                    builder: (cc) {
                                      return Expanded(
                                          flex: 1,
                                          child: fps("Percentage: ${cc.p}%"));
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  GetBuilder<MathCalculation>(
                                    builder: (cc) {
                                      return Expanded(
                                          flex: 1,
                                          child: fps(
                                              "SetPoint: ${ft.format(cc.s)} t/h"));
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              GetBuilder<MathCalculation>(
                                builder: (cc) {
                                  return Container(
                                    child: showError(
                                      ft.format(cc.error),
                                      color: (cc.error > 5 || cc.error < -5)
                                          ? Colors.red.withOpacity(.5)
                                          : Color(0xfffff4f1),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 15),
                              GetBuilder<MathCalculation>(
                                builder: (cc) {
                                  return Container(
                                      child: showActual(ft.format(cc.actwf)));
                                },
                              ),
                              SizedBox(height: 10),
                              license(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                        Color(0xffced4da),
                        Color(0xffE5E5E5),
                      ], begin: Alignment.topRight, end: Alignment.bottomRight),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 25),
                              // width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xfffff4f1).withOpacity(.3)),
                              child: Column(
                                children: [
                                  Text(
                                    "DATA CCR",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12),
                                  ),
                                  SizedBox(height: 10),
                                  NumberField(
                                      hint: 'Feeding', controller: c.feed),
                                  SizedBox(height: 10),
                                  NumberField(
                                      hint: 'Percent', controller: c.percent),
                                  SizedBox(height: 10),
                                  NumberField(
                                      hint: 'Weight', controller: c.berat),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 25),
                              // width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xfffff4f1).withOpacity(.3)),
                              child: Column(
                                children: [
                                  Text(
                                    "TIMER",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12),
                                  ),
                                  SizedBox(height: 10),
                                  NumberField(controller: c.t1),
                                  SizedBox(height: 10),
                                  NumberField(controller: c.t2),
                                  SizedBox(height: 10),
                                  NumberField(controller: c.t3),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Obx(
                                () => Expanded(
                                  flex: 1,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      style: TextStyle(
                                          color: Colors.grey[850],
                                          fontWeight: FontWeight.w600),
                                      onChanged: (val) {
                                        c.setLine(val);
                                      },
                                      value: c.selected.value,
                                      items: c.lines.map((selectedType) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            "Line $selectedType",
                                          ),
                                          value: selectedType,
                                        );
                                      }).toList()),
                                ),
                              ),
                              SizedBox(width: 80),
                              Obx(
                                () => Expanded(
                                  flex: 1,
                                  child: DropdownButton(
                                      style: TextStyle(
                                          color: Colors.grey[850],
                                          fontWeight: FontWeight.w600),
                                      onChanged: (val) {
                                        c.setMaterial(val);
                                      },
                                      value: c.material.value,
                                      items: c.materials.map((materialType) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            materialType,
                                          ),
                                          value: materialType,
                                        );
                                      }).toList()),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  StopwatchWidget(),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buttonAppBar({IconData icon, Function onPress}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xfffff4f1).withOpacity(.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 12,
              offset: Offset(3, 3),
            ),
            BoxShadow(
              color: Colors.white.withOpacity(.35),
              blurRadius: 12,
              offset: Offset(-3, -3),
            ),
          ],
        ),
        width: 45,
        height: 45,
        child: IconButton(
          icon: Icon(icon, color: Colors.grey[800]),
          onPressed: onPress,
        ),
      ),
    );
  }

  Widget license() {
    return Text(
      'Devloved By Masda Agus',
      style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Colors.grey[800].withOpacity(.5)),
    );
  }

  Widget showActual(String actual) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Color(0xfffff4f1).withOpacity(.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 12,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(.70),
            blurRadius: 12,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      height: 50,
      width: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Actual Weightfeeder",
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: .5,
                color: Colors.grey[800]),
          ),
          Text(
            "$actual t/h",
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                // letterSpacing: .5,
                color: Colors.grey[800]),
          )
        ],
      ),
    );
  }

  Widget showError(String error, {Color color}) {
    return Center(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: color,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 12,
                    offset: Offset(4, 4),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(.70),
                    blurRadius: 12,
                    offset: Offset(-4, -4),
                  ),
                ]),
            height: 80,
            width: 110,
            child: Center(
              child: Text(
                "$error%",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text('ERROR',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.grey[800]))
        ],
      ),
    );
  }

  Widget fps(String text) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Color(0xfffff4f1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]),
        ),
      ),
    );
  }

  Widget textInfo(String field) {
    return Text(
      field,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.grey[800], fontWeight: FontWeight.bold, fontSize: 12),
    );
  }
}
