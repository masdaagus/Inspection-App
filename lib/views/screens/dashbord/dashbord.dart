import 'package:Inspection/config/palette.dart';
import 'package:Inspection/views/const/const.dart';
import 'package:Inspection/views/screens/input/input.dart';
import 'package:Inspection/views/screens/login/login.dart';

import 'package:Inspection/views/screens/page_history/list_history.dart';
import 'package:Inspection/views/screens/sampling/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashbaord extends StatefulWidget {
  static const routeName = '/dashboard-screen';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: AppBar(
        backgroundColor: bagroundColor,
        centerTitle: true,
        elevation: 7,
        title: Text("Dashbaord"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: IconButton(
                icon: Icon(Icons.login),
                onPressed: () async {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                  signOut();
                },
              )),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff30638e).withOpacity(.1),
              Color(0xff003d5b).withOpacity(.1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: <Widget>[
                BuildCard(
                  tittle: "Inspection",
                  image: "assets/icons/icons8-pen-64.png",
                  press: () async {
                    Navigator.pushNamed(context, InputScreen.routName);
                  },
                ),
                BuildCard(
                  tittle: "Coming soon",
                  image: "assets/icons/icons8-order-history-64.png",
                  press: () {},
                ),
                BuildCard(
                  tittle: "Sampling",
                  image: "assets/icons/icons8-auction-64.png",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
                BuildCard(
                  tittle: "My History",
                  image: "assets/icons/icons8-bookmark-page-64.png",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListHistory()),
                    );
                  },
                ),
              ]),
        ),
      ),
    );
  }
}

class BuildCard extends StatelessWidget {
  final String tittle;
  final String image;
  final Function press;

  const BuildCard({
    Key key,
    this.tittle,
    this.image,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff3b5999).withOpacity(.36),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Image(
                      image: AssetImage(image),
                    ),
                  ),
                  Text(
                    tittle,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Palette.activeColor,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
