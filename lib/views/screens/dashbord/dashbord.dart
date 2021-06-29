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
              // gradient: LinearGradient(colors: [
              //   Color(0xff30638e).withOpacity(.15),
              //   Color(0xff003d5b).withOpacity(.15),
              // ], begin: Alignment.topRight, end: Alignment.bottomRight),
              color: Colors.white70,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.28),
                    blurRadius: 8,
                    spreadRadius: 3),
              ],
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
                      color: Colors.grey[800],
                      letterSpacing: 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
