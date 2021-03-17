import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/data_listview.dart';
import '../../models/data_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                print("press save");
                print(provider.masda.length);
              },
              child: Icon(
                Icons.send_and_archive,
              ),
            ),
          )
        ],
      ),
      body: Container(child: DataListView()),
    );
  }
}
