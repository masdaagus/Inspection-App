import 'package:flutter/material.dart';

class Penampung extends StatefulWidget {
  @override
  _PenampungState createState() => _PenampungState();
}

class _PenampungState extends State<Penampung> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("here"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 3,
              child: ListTile(
                title: Text("data"),
                subtitle: Text("Masda agus ruswoko"),
                dense: true,
                trailing: Container(
                  width: 96,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Transform.scale(
                        scale: .8,
                        child: Checkbox(
                          value: false,
                          onChanged: (val) {
                            val = val;
                          },
                        ),
                      ),
                      Transform.scale(
                        scale: .8,
                        child: Checkbox(
                          value: false,
                          onChanged: (val) {
                            val = val;
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
