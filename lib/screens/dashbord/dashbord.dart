import 'package:Inspection/Mill/screens/input/input.dart';
import 'package:Inspection/Packer/screens/input/input.dart';
import 'package:Inspection/config/palette.dart';
import 'package:Inspection/screens/dashbord/widget/buildCard.dart';
import 'package:Inspection/screens/history/history.dart';
import 'package:Inspection/screens/login/login.dart';
import 'package:Inspection/screens/sampling/home.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashbaord extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashbaord> {
  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        elevation: 2,
        title: Text("Dashbaord",
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.login, color: Colors.grey[800]),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
              signOut();
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
                    Get.to(() => HomeScreen());
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
