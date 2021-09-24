import 'package:Inspection/pages/sampling/result.dart';
import 'package:Inspection/pages/sampling/stopwatch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white60),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "CrossCheck",
        ),
        actions: <Widget>[
          // IconButton(icon: Icon(Icons.history), onPressed: () {})
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF455A64),
                    Color(0xFF546E7A),
                    Color(0xFF78909C),
                    Color(0xFFB0BEC5),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    _titleUp(),
                    buildResult(),
                    SizedBox(height: 10),
                    buildStopwatch(),
                    SizedBox(height: 30)
                    // Text(feed.text)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blueGrey[800],
      elevation: 0,
      leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
          onPressed: () {}),
      title: Text(
        "CrossCheck",
        // style: TextStyle(color: Colors.black54),
      ),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.history), onPressed: () {})
      ],
    );
  }
}

// ignore: camel_case_types
class _titleUp extends StatelessWidget {
  const _titleUp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Column(
        children: [
          SizedBox(height: 10),
          Center(
            child: Text(
              "RESULT",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 3,
                  color: Colors.grey),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.blueGrey[800],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100))),
    );
  }
}
