import 'package:Inspection/Database/database_mill.dart';
import 'package:Inspection/model_database/mill_model.dart';
import 'package:Inspection/views/const/const.dart';
import 'package:Inspection/views/screens/pdf_detail/api/detail_api.dart';
import 'package:Inspection/views/screens/pdf_detail/api/pdf_detail.dart';
import 'package:Inspection/views/screens/pdf_detail/model/model_pdf.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListHistory extends StatelessWidget {
  final f = new DateFormat('dd-MM-yyyy');

  final String bagfilter = 'Bag Filter';
  final String fncf = 'Motor temperatur dan vibrasi';
  final String bfcf = 'Hopper, cerobong dan sistem purging';
  final String neddle = 'Needle Gate';
  final String neddlecf = 'Posisi Round Bar';
  final String wf = 'Weight Feeder';
  final String wfcf = 'Belt, chute, buffle, motor, dan gear box';
  final String bc = 'Belt Conveyor';
  final String bccf = "Motor, belt, rubber, roller (carry & return), cleaner";
  final String sc = 'Screw Conveyor';
  final String sccf = 'Level Oli, motor, screw, gear box';
  final String be = 'Bucket Elevator';
  final String becf = 'Level Oli, motor, screw, gear box, noise';
  final String bm = 'Ball Mill';
  final String bmcf =
      'Motor gearbox (temp & vibration), \nBaut & Mur (tube mill main hole, coupling), \nMill head trinion (inlet & outlet)';

  final String lq = 'Oil Circulation GearBox';
  final String lqcf = 'Laju Sirkulasi Oli, level dan temp oli';
  final String sr = 'Clasifier';
  final String srcf = 'Motor, coupling dan V-Belt classifer, level grease';
  final String rf = 'Rotary Valve';
  final String rfcf = 'Motor dan putaran RV, leakage (kebocoran)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColor,
      appBar: AppBar(
        backgroundColor: bagroundColor,
        title: Text("List History"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffced4da)),
          child: FutureBuilder(
            future: DatabaseMill.instance.readAllNotes(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(child: Center(child: Text("Loading...")));
              } else {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Mill mill = snapshot.data[index];
                    return Column(
                      children: [
                        ListTile(
                          onTap: () async {
                            final invoice1 = Invoice(
                                date: f.format(mill.createTime),
                                items: [
                                  InvoiceItem(
                                      code: "BF-07",
                                      equipments: bagfilter,
                                      checkpoints: bfcf,
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "FN-07",
                                      equipments: "Fan" + bagfilter,
                                      checkpoints: fncf,
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "BF-08",
                                      equipments: bagfilter,
                                      checkpoints: bfcf,
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "FN-08",
                                      equipments: bagfilter,
                                      checkpoints: fncf,
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "BF-09",
                                      equipments: bagfilter,
                                      checkpoints: bfcf,
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "FN-09",
                                      equipments: "Bag Filter",
                                      checkpoints: fncf,
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "BF-10",
                                      equipments: bagfilter,
                                      checkpoints: bfcf,
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "FN-10",
                                      equipments: "Bag Filter",
                                      checkpoints: fncf,
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "NG-01",
                                      equipments: neddle,
                                      checkpoints: neddlecf,
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "NG-02",
                                      equipments: neddle,
                                      checkpoints: neddlecf,
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "NG-03",
                                      equipments: neddle,
                                      checkpoints: neddlecf,
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "NG-04",
                                      equipments: neddle,
                                      checkpoints: neddlecf,
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "WF-01",
                                      equipments: "Bag Filter",
                                      checkpoints:
                                          "Hopper, cerobong dan sistem purging",
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "WF-02",
                                      equipments: "Bag Filter",
                                      checkpoints:
                                          "Hopper, cerobong dan sistem purging",
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "WF-03",
                                      equipments: "Bag Filter",
                                      checkpoints:
                                          "Hopper, cerobong dan sistem purging",
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                  InvoiceItem(
                                      code: "WF-04",
                                      equipments: "Bag Filter",
                                      checkpoints:
                                          "Hopper, cerobong dan sistem purging",
                                      line1: mill.bf07l1,
                                      line2: mill.bf07l2,
                                      remarksline1: mill.desbf07l1,
                                      remarksline2: mill.desbf07l2),
                                ]);

                            final pdfFile = await PdfPageApi.generate(invoice1);
                            PdfDetailApi.openFile(pdfFile);

                            print(mill.id);
                          },
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          title: Text(f.format(mill.createTime),
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          leading: Text(mill.id.toString(),
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 11)),
                          tileColor: Colors.grey[300],
                          dense: true,
                        ),
                        Divider(height: 1, color: Colors.black),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
