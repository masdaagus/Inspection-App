import 'package:Inspection/data/data.dart';
import 'package:flutter/material.dart';

class DemoDetailsPage extends StatelessWidget {
  final DetailsData data;
  DemoDetailsPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Update");
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            data.code,
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.edit),
            ),
          ],
        ),
        backgroundColor: Colors.amber,
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: Center(child: Text(data.code)),
            ),
          ],
        ),
      ),
    );
  }
}
