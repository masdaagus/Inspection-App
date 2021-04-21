import 'package:Inspection/data/data2.dart';
import 'package:Inspection/views/models/data_model.dart';
import 'package:Inspection/views/details_screen/components/pick_line.dart';
import 'package:Inspection/views/details_screen/components/remarks_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  final Data data;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataModel>(context, listen: false);
    print("Update Detail page");
    IsiData masda = data.data[0];
    return Material(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              masda.equipments,
              style: TextStyle(fontSize: 17),
            ),
            centerTitle: true,
            actions: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Center(
                      child: Text(
                    masda.code,
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
                            PickButton(
                                tittle: '1',
                                onpress: () {
                                  provider.line1();
                                  print("press line 1");
                                },
                                width: 60,
                                height: 30),
                            SizedBox(width: 6),
                            PickButton(
                                tittle: '2',
                                onpress: () {
                                  provider.line2();
                                  print("press line 2");
                                },
                                width: 60,
                                height: 30)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    // ini yg akan di kerjakan
                    RemarksTextField(),
                    SizedBox(height: 18),
                    Center(
                        child: PickButton(
                      tittle: 'Save',
                      onpress: () {
                        print("press save button");
                        print(provider.lineBerapa);
                      },
                      width: MediaQuery.of(context).size.width * .6,
                      height: 40,
                      fontsize: 18,
                    )),
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
