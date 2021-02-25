import 'package:flutter/material.dart';
import '../../../data.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
        future: fetchData(context),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                DetailsData data = snapshot.data[index];
                return Container(
                  child: Center(
                      child: Text(
                    "${data.code}",
                    style: TextStyle(),
                  )),
                );
              });
        },
      ),
    );
  }
}
