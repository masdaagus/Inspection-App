import 'package:flutter/material.dart';
import 'package:Inspection/data.dart';

class DetailPage extends StatefulWidget {
  final DetailsData data;

  DetailPage({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String line = "Line - ?";

  void lineWhere() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          margin: EdgeInsets.only(top: 32),
          color: Colors.grey[400],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 75,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.data.equipments,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "(${widget.data.code})",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "14-02-2021   ",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Shift-1",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Remakrs",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 25,
                              width: 55,
                              child: RaisedButton(
                                child: Center(
                                    child: Text(
                                  "#1",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )),
                                onPressed: () {
                                  setState(() {
                                    line = "Line -1";
                                  });
                                },
                                color: Color(0xFFB0BEC5),
                                elevation: 3,
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              height: 25,
                              width: 55,
                              child: RaisedButton(
                                child: Center(
                                    child: Text(
                                  "#2",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )),
                                onPressed: () {
                                  setState(() {
                                    line = "Line - 2";
                                  });
                                },
                                color: Color(0xFFB0BEC5),
                                elevation: 3,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 2),
                    Center(
                      child: Text(
                        line,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 6),
                    TextFormField(
                      maxLines: 8,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
