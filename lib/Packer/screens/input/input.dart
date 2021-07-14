import 'package:Inspection/Packer/models/data_packer.dart';
import 'package:Inspection/Packer/screens/input/widget/header.dart';
import 'package:Inspection/Packer/screens/input/widget/list_tile.dart';
import 'package:Inspection/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/list_special.dart';

class InputPacker extends StatelessWidget {
  List<DataPacker> _allData = [];
  final getC = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
          "Inspection Packer",
          style: TextStyle(
              fontSize: 17,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<Controller>(
              initState: (c) {
                getC.shiftFormate();
                getC.getUser();
              },
              builder: (_) {
                return Header(
                  userName: "${getC.userName}",
                  userId: "${getC.userId}",
                  f: getC.f,
                  shift: "${getC.shift}",
                  date: getC.now,
                );
              },
            ),
            ListTileSpecial(),
            FutureBuilder(
              future: fetchData(context),
              builder: (context, snapshot) {
                _allData = snapshot.data;
                return snapshot.data == null
                    ? Center(
                        child: Text("Loading....."),
                      )
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          DataPacker data = snapshot.data[index];
                          return ListItem(data: data);
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
