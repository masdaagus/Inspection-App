import 'package:Inspection/Database/database.dart';
import 'package:Inspection/screens/history/tab_mill/tab_mill.dart';
import 'package:Inspection/screens/history/tab_packer/tab_packer.dart';
import 'package:flutter/material.dart';

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
  ];

  int _initializeTab;

  Future<int> packer() async {
    List _listPacker = await DatabaseMill.instance.readAllPacker();
    List _listMill = await DatabaseMill.instance.readAllMill();

    if (_listPacker.length > _listMill.length) {
      return _initializeTab = 1;
    } else {
      return _initializeTab = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_initializeTab);
    return DefaultTabController(
      initialIndex: _initializeTab ?? 0,
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
          ],
        ),
      ),
    );
  }
}
