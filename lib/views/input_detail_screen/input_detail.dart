import 'package:Inspection/template/data.dart';
import 'package:Inspection/views/const/const.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    Key key,
    @required this.data,
  }) : super(key: key);
  final DataMill data;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextEditingController _controller1;
  TextEditingController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController(text: widget.data.description_1);
    _controller2 = TextEditingController(text: widget.data.description_2);
  }

  @override
  Widget build(BuildContext context) {
    print("Update Detail page");
    return Material(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: bagroundColor,
            title: Text(
              widget.data.equipments,
              style: TextStyle(fontSize: 17),
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Center(
                      child: Text(
                    widget.data.code,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  )))
            ],
            centerTitle: true,
            elevation: 0,
          ),
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
                      TextField(
                        controller: _controller1,
                        onChanged: (value) {
                          widget.data.description_1 = value;
                        },
                        maxLines: 8,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Line #2",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      TextField(
                        controller: _controller2,
                        onChanged: (value) {
                          widget.data.description_2 = value;
                        },
                        maxLines: 8,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
