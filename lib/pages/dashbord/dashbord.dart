import 'package:Inspection/controller/controller.dart';
import 'package:Inspection/pages/croscheck/crosscheck.dart';
import 'package:Inspection/pages/mill/input/input.dart';
import 'package:Inspection/pages/packer/input/input.dart';
import 'package:Inspection/config/palette.dart';

import 'package:Inspection/pages/dashbord/widget/buildCard.dart';
import 'package:Inspection/pages/history/history.dart';
import 'package:Inspection/pages/login/login.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashbaord extends StatelessWidget {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor.withOpacity(.9),
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        elevation: 2,
        title: Text("Dashboard",
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout, color: Colors.grey[800]),
            onPressed: () {
              Get.defaultDialog(
                buttonColor: Colors.white,
                confirmTextColor: Colors.grey[800],
                cancelTextColor: Colors.grey[800],
                middleText: "Apakah anda ingin keluar ?",
                title: 'Inspection',
                textCancel: 'No',
                textConfirm: "Yes",
                onConfirm: () {
                  Get.back();
                  Get.offAll(LoginScreen());
                  controller.signOut();
                },
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: <Widget>[
                BuildCard(
                  tittle: "Mill",
                  image: "assets/icons/icons8-survey-64.png",
                  press: () async {
                    Get.to(() => InputMill());
                  },
                ),
                BuildCard(
                  tittle: "Packer",
                  image: "assets/icons/icons8-survey-64.png",
                  press: () {
                    Get.to(() => InputPacker());
                  },
                ),
                BuildCard(
                  tittle: "Sampling",
                  image: "assets/icons/icons8-scales-50.png",
                  press: () {
                    Get.to(() => CrossCheck());
                  },
                ),
                BuildCard(
                  tittle: "My History",
                  image: "assets/icons/icons8-history-book-50.png",
                  press: () {
                    Get.to(() => History());
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
