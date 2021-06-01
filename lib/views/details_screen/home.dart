import 'package:Inspection/template/data.dart';
import 'package:Inspection/views/details_screen/components/remarks_text.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  // final Data data;
  final DataMill data;

  @override
  Widget build(BuildContext context) {
    print("Update Detail page");
    // IsiData masda = data.data[0];
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
                  child: Center(
                      child: Text(
                    data.code,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  )))
            ]),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ListView(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        child: Text(
                          "Remarks",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Line #1",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    RemarksTextField(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Line #2",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    RemarksTextField(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
