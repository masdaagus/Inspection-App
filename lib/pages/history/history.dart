import 'package:Inspection/pages/mill/history/history-mill.dart';
import 'package:Inspection/pages/packer/history/history-packer.dart';
import 'package:flutter/material.dart';

import '../croscheck/history/history_checker.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Tab> tabs = [
    Tab(
      child: Text(
        "MILL",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    ),
    Tab(
      child: Text(
        "PACKER",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    ),
    Tab(
      child: Text(
        "CrossCheck",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Text(
            "History",
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          elevation: 1,
          bottom: TabBar(
            tabs: tabs,
            labelColor: Colors.grey[800],
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 2),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            MillStory(),
            PackerHistory(),
            CheckerStory(),
          ],
        ),
      ),
    );
  }
}
