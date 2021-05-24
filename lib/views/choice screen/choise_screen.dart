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
        title: Text("Hallo Masda"),
      ),
      body: Container(
        child: Center(
            child: Text(
          "Comming soon",
        )),
      ),
    );
  }
}
