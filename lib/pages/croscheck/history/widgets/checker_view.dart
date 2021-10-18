import 'package:Inspection/config/palette.dart';
import 'package:Inspection/controller/controller.dart';
import 'package:Inspection/pages/croscheck/model/model-cc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckerView extends StatelessWidget {
  const CheckerView({
    Key key,
    this.data,
    this.date,
  }) : super(key: key);

  final data;
  final date;

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<Controller>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
          onPressed: () async {
            Get.back();
          },
        ),
        title: Text(
          "CrossCheck",
          style: TextStyle(
              fontSize: 17,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffced4da),
              Color(0xffE5E5E5),
            ], begin: Alignment.topRight, end: Alignment.bottomRight),
          ),
          width: double.infinity,
          child: Column(
            children: [
              headerView(ctrl.userName, ctrl.idUser),
              Container(
                margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xfffff4f1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: textInfo("Line ${data[CrossCheckInput.line]}")),
                    SizedBox(width: 55),
                    Expanded(flex: 1, child: textInfo(f.format(date))),
                    SizedBox(width: 55),
                    Expanded(
                        flex: 1,
                        child: textInfo(data[CrossCheckInput.material])),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xfffff4f1).withOpacity(.3)),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: fps(
                                "Feeding: ${data[CrossCheckInput.feeding]} t/h")),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 1,
                            child: fps(
                                "Percentage: ${data[CrossCheckInput.percentage]}%")),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 1,
                            child: fps(
                                "SetPoint: ${data[CrossCheckInput.setPoint]} t/h")),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        showWeightandTimer(
                            'Weight', data[CrossCheckInput.weight]),
                        Container(
                          child: showError(
                            ft.format(data[CrossCheckInput.error]),
                            color: (data[CrossCheckInput.error] > 5 ||
                                    data[CrossCheckInput.error] < -5)
                                ? Colors.red.withOpacity(.5)
                                : Color(0xfffff4f1),
                          ),
                        ),
                        showWeightandTimer(
                            'Timer', ft.format(data[CrossCheckInput.timer])),
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                        child: showActual(
                            ft.format(data[CrossCheckInput.actualWf]))),
                    SizedBox(height: 10),
                    license(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container showWeightandTimer(String tittle, var field) {
    return Container(
      // height: 30,
      width: 70,
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Color(0xfffff4f1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              tittle,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]),
            ),
            Divider(),
            Text(
              field.toString(),
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerView(String userName, String id) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xfffff4f1).withOpacity(.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 12,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(.50),
            blurRadius: 12,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.person_outline, size: 38),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[800]),
                  ),
                  Text(id,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700])),
                ],
              ),
            ],
          ),
          Text(
            "Shift ${data[CrossCheckInput.shift]}",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: Colors.grey[800]),
          ),
        ],
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
}
