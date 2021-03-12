import 'package:flutter/material.dart';
import 'components/data_listview.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(child: DataListView()),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      title: Text(
        "INSPECTION MILL",
        style: TextStyle(fontSize: 17),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.edit),
        ),
      ],
    );
  }
}
