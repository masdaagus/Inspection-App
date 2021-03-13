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
            data.equipments,
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.edit),
            ),
          ],
          leading: Center(
              child: Text(
            data.code,
            style: TextStyle(fontSize: 12, color: Colors.black45),
          )),
        ),
        backgroundColor: Colors.amber,
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Remarks",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
