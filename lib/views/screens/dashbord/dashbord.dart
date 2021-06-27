import 'package:Inspection/views/const/const.dart';
import 'package:Inspection/views/screens/input/input.dart';

import 'package:Inspection/views/screens/page_history/list_history.dart';
import 'package:flutter/material.dart';

class Dashbaord extends StatefulWidget {
  static const routeName = '/dashboard-screen';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashbaord> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text("0")),
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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 50,
              crossAxisSpacing: 50,
              children: <Widget>[
                DashbordCard(
                    tittle: "Inspection",
                    image: "assets/icons/icons8-pen-64.png",
                    press: () async {
                      Navigator.pushNamed(context, InputScreen.routName);
                    }),
                DashbordCard(
                  tittle: "History",
                  image: "assets/icons/icons8-order-history-64.png",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListHistory()),
                    );
                  },
                ),
                DashbordCard(
                  tittle: "Sampling",
                  image: "assets/icons/icons8-auction-64.png",
                  press: () {},
                ),
                DashbordCard(
                  tittle: "My Sheet",
                  image: "assets/icons/icons8-bookmark-page-64.png",
                  press: () {},
                ),
              ]),
        ),
      ),
    );
  }
}

class DashbordCard extends StatelessWidget {
  final String tittle;
  final String image;
  final Function press;

  const DashbordCard({
    this.tittle,
    this.image,
    this.press,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xff30638e).withOpacity(.17),
          Color(0xff003d5b).withOpacity(.23)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(13),
          onTap: press,
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
                    color: Color(0xff003049)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
