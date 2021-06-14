import 'package:Inspection/views/page_history_screen/list_history.dart';
import 'package:Inspection/views/input_screen/input.dart';
import 'package:flutter/material.dart';

class HomeChoice extends StatefulWidget {
  @override
  _HomeChoiceState createState() => _HomeChoiceState();
}

class _HomeChoiceState extends State<HomeChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Text("Dashbord"),
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
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 50,
                crossAxisSpacing: 50,
                children: <Widget>[
                  DashbordCard(
                    tittle: "Inspection",
                    image: "assets/images/icons8-pen-64.png",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeListScreen()),
                      );
                    },
                  ),
                  DashbordCard(
                    tittle: "History",
                    image: "assets/images/icons8-order-history-64.png",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListHistory()),
                      );
                    },
                  ),
                  DashbordCard(
                    tittle: "Sampling",
                    image: "assets/images/icons8-weight-kg-64.png",
                    press: () {},
                  ),
                  DashbordCard(
                    tittle: "My Sheet",
                    image: "assets/images/icons8-bookmark-64.png",
                    press: () {},
                  ),
                ])),
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
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 23,
            spreadRadius: -13,
            color: Color(0xFFE6E6E6),
          ),
        ],
        gradient: LinearGradient(
            colors: [Color(0xffB1B5C8), Color(0xffD7D9E3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
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
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
