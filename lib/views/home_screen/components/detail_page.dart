import 'package:Inspection/data/data.dart';
import 'package:Inspection/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoDetailsPage extends StatefulWidget {
  DemoDetailsPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  final DetailsData data;

  @override
  _DemoDetailsPageState createState() => _DemoDetailsPageState();
}

class _DemoDetailsPageState extends State<DemoDetailsPage> {
  TextEditingController controller = TextEditingController();

  get masdaaa => controller;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataModel>(context, listen: false);
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
                ),
              ),
            ),
          ],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<DataModel>(
                          builder: (context, model, _) => Text(
                            "Remarks :  ${model.lineBerapa}",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            button(
                                tittle: '1',
                                onpress: () {
                                  provider.line1();
                                  print("press line 1");
                                },
                                width: 60,
                                height: 30),
                            SizedBox(width: 6),
                            button(
                                tittle: '2',
                                onpress: () {
                                  provider.line2();
                                },
                                width: 60,
                                height: 30),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: controller,
                      maxLines: 10,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(height: 18),
                    Center(
                      child: button(
                          tittle: 'Save',
                          onpress: () {
                            print("press save button");
                            print(provider.lineBerapa);
                            print(provider.masda.length);
                            print(controller.text);
                          },
                          width: MediaQuery.of(context).size.width * .6,
                          height: 40,
                          fontsize: 18),
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

  Widget button(
      {Function onpress,
      String tittle,
      double width,
      double height,
      double fontsize}) {
    return Container(
      height: height,
      width: width,
      child: RaisedButton(
          onPressed: onpress,
          color: Color(0xFFB0BEC5),
          splashColor: Colors.white,
          elevation: 0.20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              tittle,
              style: TextStyle(color: Colors.blueGrey[600], fontSize: fontsize),
            ),
          ),
          textColor: Colors.white),
    );
  }
}
