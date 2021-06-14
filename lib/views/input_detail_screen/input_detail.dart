import 'package:Inspection/template/data.dart';
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

  @override
  void initState() {
    _controller1 = TextEditingController(text: widget.data.description_1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Update Detail page");
    return Material(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              widget.data.equipments,
              style: TextStyle(fontSize: 17),
            ),
            centerTitle: true,
            actions: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Center(
                      child: Text(
                    widget.data.code,
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
        ),
      ),
    );
  }
}