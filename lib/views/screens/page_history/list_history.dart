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
                            final invoice1 = Invoice(items: [
                              InvoiceItem(
                                  no: 1,
                                  code: "BF-07",
                                  equipments: bagfilter,
                                  checkpoints: bfcf,
                                  line1: mill.bf07l1,
                                  line2: mill.bf07l2,
                                  remarksline1: mill.desbf07l1,
                                  remarksline2: mill.desbf07l2),
                              InvoiceItem(
                                  no: 2,
                                  code: "FN-07",
                                  equipments: "Fan " + bagfilter,
                                  checkpoints: fncf,
                                  line1: mill.fn07l1,
                                  line2: mill.fn07l2,
                                  remarksline1: mill.desfn07l1,
                                  remarksline2: mill.desfn07l2),
                              InvoiceItem(
                                  no: 3,
                                  code: "BF-08",
                                  equipments: bagfilter,
                                  checkpoints: bfcf,
                                  line1: mill.bf08l1,
                                  line2: mill.bf08l2,
                                  remarksline1: mill.desbf08l1,
                                  remarksline2: mill.desbf08l2),
                              InvoiceItem(
                                  no: 4,
                                  code: "FN-08",
                                  equipments: "Fan " + bagfilter,
                                  checkpoints: fncf,
                                  line1: mill.fn08l1,
                                  line2: mill.fn08l2,
                                  remarksline1: mill.desfn08l1,
                                  remarksline2: mill.desfn08l2),
                              InvoiceItem(
                                  no: 5,
                                  code: "BF-09",
                                  equipments: bagfilter,
                                  checkpoints: bfcf,
                                  line1: mill.bf09l1,
                                  line2: mill.bf09l2,
                                  remarksline1: mill.desbf09l1,
                                  remarksline2: mill.desbf09l2),
                              InvoiceItem(
                                  no: 6,
                                  code: "FN-09",
                                  equipments: "Fan " + bagfilter,
                                  checkpoints: fncf,
                                  line1: mill.fn09l1,
                                  line2: mill.fn09l2,
                                  remarksline1: mill.desfn09l1,
                                  remarksline2: mill.desfn09l2),
                              InvoiceItem(
                                  no: 7,
                                  code: "BF-10",
                                  equipments: bagfilter,
                                  checkpoints: bfcf,
                                  line1: mill.bf10l1,
                                  line2: mill.bf10l2,
                                  remarksline1: mill.desbf10l1,
                                  remarksline2: mill.desbf10l2),
                              InvoiceItem(
                                  no: 8,
                                  code: "FN-10",
                                  equipments: "Fan " + bagfilter,
                                  checkpoints: fncf,
                                  line1: mill.fn10l1,
                                  line2: mill.fn10l2,
                                  remarksline1: mill.desfn10l1,
                                  remarksline2: mill.desfn10l2),
                              InvoiceItem(
                                  no: 9,
                                  code: "NG-01",
                                  equipments: neddle,
                                  checkpoints: neddlecf,
                                  line1: mill.ng01l1,
                                  line2: mill.ng01l2,
                                  remarksline1: mill.desng01l1,
                                  remarksline2: mill.desng01l2),
                              InvoiceItem(
                                  no: 10,
                                  code: "NG-02",
                                  equipments: neddle,
                                  checkpoints: neddlecf,
                                  line1: mill.ng02l1,
                                  line2: mill.ng02l2,
                                  remarksline1: mill.desng02l1,
                                  remarksline2: mill.desng02l2),
                              InvoiceItem(
                                  no: 11,
                                  code: "NG-03",
                                  equipments: neddle,
                                  checkpoints: neddlecf,
                                  line1: mill.ng03l1,
                                  line2: mill.ng03l2,
                                  remarksline1: mill.desng03l1,
                                  remarksline2: mill.desng03l2),
                              InvoiceItem(
                                  no: 12,
                                  code: "NG-04",
                                  equipments: neddle,
                                  checkpoints: neddlecf,
                                  line1: mill.ng04l1,
                                  line2: mill.ng04l2,
                                  remarksline1: mill.desng04l1,
                                  remarksline2: mill.desng04l2),
                              InvoiceItem(
                                  no: 13,
                                  code: "WF-01",
                                  equipments: wf + " Limestone",
                                  checkpoints: wfcf,
                                  line1: mill.wf01l1,
                                  line2: mill.wf01l2,
                                  remarksline1: mill.deswf01l1,
                                  remarksline2: mill.deswf01l2),
                              InvoiceItem(
                                  no: 14,
                                  code: "WF-02",
                                  equipments: wf + " Clinker",
                                  checkpoints: wfcf,
                                  line1: mill.wf02l1,
                                  line2: mill.wf02l2,
                                  remarksline1: mill.deswf02l1,
                                  remarksline2: mill.deswf02l2),
                              InvoiceItem(
                                  no: 15,
                                  code: "WF-03",
                                  equipments: wf + " Trass",
                                  checkpoints: wfcf,
                                  line1: mill.wf03l1,
                                  line2: mill.wf03l2,
                                  remarksline1: mill.deswf03l1,
                                  remarksline2: mill.deswf03l2),
                              InvoiceItem(
                                  no: 16,
                                  code: "WF-04",
                                  equipments: wf + " Gypsum",
                                  checkpoints: wfcf,
                                  line1: mill.wf04l1,
                                  line2: mill.wf04l2,
                                  remarksline1: mill.deswf04l1,
                                  remarksline2: mill.deswf04l2),
                              InvoiceItem(
                                  no: 17,
                                  code: "BC-01",
                                  equipments: bc,
                                  checkpoints: bccf,
                                  line1: mill.bc01l1,
                                  line2: mill.bc01l2,
                                  remarksline1: mill.desbc01l1,
                                  remarksline2: mill.desbc01l2),
                              InvoiceItem(
                                  no: 18,
                                  code: "BC-02",
                                  equipments: bc,
                                  checkpoints: bccf,
                                  line1: mill.bc02l1,
                                  line2: mill.bc02l2,
                                  remarksline1: mill.desbc02l1,
                                  remarksline2: mill.desbc02l2),
                              InvoiceItem(
                                  no: 19,
                                  code: "BF-02",
                                  equipments: bagfilter,
                                  checkpoints: bfcf,
                                  line1: mill.bf02l1,
                                  line2: mill.bf02l2,
                                  remarksline1: mill.desbf02l1,
                                  remarksline2: mill.desbf02l2),
                              InvoiceItem(
                                  no: 20,
                                  code: "FN-02",
                                  equipments: "Fan " + bagfilter,
                                  checkpoints: fncf,
                                  line1: mill.fn02l1,
                                  line2: mill.fn02l2,
                                  remarksline1: mill.desfn02l1,
                                  remarksline2: mill.desfn02l2),
                              InvoiceItem(
                                  no: 21,
                                  code: "BF-03",
                                  equipments: bagfilter,
                                  checkpoints: bfcf,
                                  line1: mill.bf03l1,
                                  line2: mill.bf03l2,
                                  remarksline1: mill.desbf03l1,
                                  remarksline2: mill.desbf03l2),
                              InvoiceItem(
                                  no: 22,
                                  code: "FN-03",
                                  equipments: "Fan " + bagfilter,
                                  checkpoints: fncf,
                                  line1: mill.fn03l1,
                                  line2: mill.fn03l2,
                                  remarksline1: mill.desfn03l1,
                                  remarksline2: mill.desfn03l2),
                              InvoiceItem(
                                  no: 23,
                                  code: "BF-04",
                                  equipments: bagfilter,
                                  checkpoints: bfcf,
                                  line1: mill.bf04l1,
                                  line2: mill.bf04l2,
                                  remarksline1: mill.desbf04l1,
                                  remarksline2: mill.desbf04l2),
                              InvoiceItem(
                                  no: 24,
                                  code: "FN-04",
                                  equipments: "Fan " + bagfilter,
                                  checkpoints: fncf,
                                  line1: mill.fn04l1,
                                  line2: mill.fn04l2,
                                  remarksline1: mill.desfn04l1,
                                  remarksline2: mill.desfn04l2),
                              InvoiceItem(
                                  no: 25,
                                  code: "BF-05",
                                  equipments: bagfilter,
                                  checkpoints: bfcf,
                                  line1: mill.bf05l1,
                                  line2: mill.bf05l2,
                                  remarksline1: mill.desbf05l1,
                                  remarksline2: mill.desbf05l2),
                              InvoiceItem(
                                  no: 26,
                                  code: "FN-05",
                                  equipments: "Fan " + bagfilter,
                                  checkpoints: fncf,
                                  line1: mill.fn05l1,
                                  line2: mill.fn05l2,
                                  remarksline1: mill.desfn05l1,
                                  remarksline2: mill.desfn05l2),
                              InvoiceItem(
                                  no: 27,
                                  code: "BF-06",
                                  equipments: bagfilter,
                                  checkpoints: bfcf,
                                  line1: mill.bf06l1,
                                  line2: mill.bf06l2,
                                  remarksline1: mill.desbf06l1,
                                  remarksline2: mill.desbf06l2),
                              InvoiceItem(
                                  no: 28,
                                  code: "FN-06",
                                  equipments: "Fan " + bagfilter,
                                  checkpoints: fncf,
                                  line1: mill.fn06l1,
                                  line2: mill.fn06l2,
                                  remarksline1: mill.desfn06l1,
                                  remarksline2: mill.desfn06l2),
                              InvoiceItem(
                                  no: 29,
                                  code: "SC-01",
                                  equipments: sc,
                                  checkpoints: sccf,
                                  line1: mill.sc01l1,
                                  line2: mill.sc01l2,
                                  remarksline1: mill.dessc01l1,
                                  remarksline2: mill.dessc01l2),
                              InvoiceItem(
                                  no: 30,
                                  code: "SC-02",
                                  equipments: sc,
                                  checkpoints: sccf,
                                  line1: mill.sc02l1,
                                  line2: mill.sc02l2,
                                  remarksline1: mill.dessc02l1,
                                  remarksline2: mill.dessc02l2),
                              InvoiceItem(
                                  no: 31,
                                  code: "SC-03",
                                  equipments: sc,
                                  checkpoints: sccf,
                                  line1: mill.sc03l1,
                                  line2: mill.sc03l2,
                                  remarksline1: mill.dessc03l1,
                                  remarksline2: mill.dessc03l2),
                              InvoiceItem(
                                  no: 32,
                                  code: "BE-01",
                                  equipments: be,
                                  checkpoints: becf,
                                  line1: mill.be01l1,
                                  line2: mill.be01l2,
                                  remarksline1: mill.desbe01l1,
                                  remarksline2: mill.desbe01l2),
                              InvoiceItem(
                                  no: 33,
                                  code: "BM-01",
                                  equipments: bm,
                                  checkpoints: bmcf,
                                  line1: mill.bm01l1,
                                  line2: mill.bm01l2,
                                  remarksline1: mill.desbm01l1,
                                  remarksline2: mill.desbm01l2),
                              InvoiceItem(
                                  no: 34,
                                  code: "LQ-01",
                                  equipments: lq,
                                  checkpoints: lqcf,
                                  line1: mill.lq01l1,
                                  line2: mill.lq01l2,
                                  remarksline1: mill.deslq01l1,
                                  remarksline2: mill.deslq01l2),
                              InvoiceItem(
                                  no: 35,
                                  code: "LQ-02",
                                  equipments: lq,
                                  checkpoints: lqcf,
                                  line1: mill.lq02l1,
                                  line2: mill.lq02l2,
                                  remarksline1: mill.deslq02l1,
                                  remarksline2: mill.deslq02l2),
                              InvoiceItem(
                                  no: 36,
                                  code: "SR-01",
                                  equipments: sr,
                                  checkpoints: srcf,
                                  line1: mill.sr01l1,
                                  line2: mill.sr01l2,
                                  remarksline1: mill.dessr01l1,
                                  remarksline2: mill.dessr01l2),
                              InvoiceItem(
                                  no: 37,
                                  code: "BF-01",
                                  equipments: bagfilter,
                                  checkpoints: bfcf,
                                  line1: mill.bf01l1,
                                  line2: mill.bf01l2,
                                  remarksline1: mill.desbf01l1,
                                  remarksline2: mill.desbf01l2),
                              InvoiceItem(
                                  no: 38,
                                  code: "FN-01",
                                  equipments: "Fan " + bagfilter,
                                  checkpoints: fncf,
                                  line1: mill.fn01l1,
                                  line2: mill.fn01l2,
                                  remarksline1: mill.desfn01l1,
                                  remarksline2: mill.desfn01l2),
                              InvoiceItem(
                                  no: 39,
                                  code: "RF-01",
                                  equipments: rf,
                                  checkpoints: rfcf,
                                  line1: mill.rf01l1,
                                  line2: mill.rf01l2,
                                  remarksline1: mill.desrf01l1,
                                  remarksline2: mill.desrf01l2),
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
