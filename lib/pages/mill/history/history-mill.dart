import 'package:Inspection/config/tittle.dart';
import 'package:Inspection/controller/controller.dart';
import 'package:Inspection/pages/mill/controller/mill_cloud.dart';
import 'package:Inspection/pages/mill/models/mill.dart';
import 'package:Inspection/pages/show-pdf/mill/pdf_detail.dart';
import 'package:Inspection/config/palette.dart';
import 'package:Inspection/service/pdf_helper/api/detail_api.dart';
import 'package:Inspection/service/pdf_helper/models/model_pdf_mill.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MillStory extends StatefulWidget {
  @override
  _MillStoryState createState() => _MillStoryState();
}

class _MillStoryState extends State<MillStory> {
  MillCloudController controller = MillCloudController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder<QuerySnapshot<Object>>(
            future: controller.getData("mill"),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Container(
                  padding: EdgeInsets.only(top: 300),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> data = snapshot.data.docs[index].data()
                        as Map<String, dynamic>;
                    DateTime date = DateFormat('yyyy-MM-dd hh:mm:ss')
                        .parse(data[MillFirebaseInput.time]);
                    final ctrl = Get.put(Controller());
                    if (data[MillFirebaseInput.userName] == ctrl.userName) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 6, right: 3, left: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffdee2ff).withOpacity(.3),
                                  Color(0xffced4da),
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.20),
                                    blurRadius: 1.5,
                                    spreadRadius: 1),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.only(
                                left: 28,
                                right: 5,
                                top: 5,
                                bottom: 5,
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${f.format(date)}#${data[MillFirebaseInput.shift]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    data[MillFirebaseInput.userName],
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              trailing: Container(
                                width: 90,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.picture_as_pdf),
                                    Container(
                                      height: 40,
                                      width: 50,
                                      child: IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          controller.deleteData(
                                              snapshot.data.docs[index].id);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              dense: true,
                              onTap: () async {
                                final invoice = Invoice(
                                  id: data[MillFirebaseInput.idUser],
                                  name: data[MillFirebaseInput.userName],
                                  shift: data[MillFirebaseInput.shift],
                                  date: f.format(date),
                                  items: [
                                    InvoiceItem(
                                        no: 1,
                                        code: "BF-07",
                                        equipments: MillTittle.bagfilter,
                                        checkpoints: MillTittle.bfcf,
                                        line1: data[MillFirebaseInput.bf07l1],
                                        line2: data[MillFirebaseInput.bf07l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbf07l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbf07l2]),
                                    InvoiceItem(
                                        no: 2,
                                        code: "FN-07",
                                        equipments:
                                            "Fan " + MillTittle.bagfilter,
                                        checkpoints: MillTittle.fncf,
                                        line1: data[MillFirebaseInput.fn07l1],
                                        line2: data[MillFirebaseInput.fn07l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desfn07l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desfn07l2]),
                                    InvoiceItem(
                                        no: 3,
                                        code: "BF-08",
                                        equipments: MillTittle.bagfilter,
                                        checkpoints: MillTittle.bfcf,
                                        line1: data[MillFirebaseInput.bf08l1],
                                        line2: data[MillFirebaseInput.bf08l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbf08l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbf08l2]),
                                    InvoiceItem(
                                        no: 4,
                                        code: "FN-08",
                                        equipments:
                                            "Fan " + MillTittle.bagfilter,
                                        checkpoints: MillTittle.fncf,
                                        line1: data[MillFirebaseInput.fn08l1],
                                        line2: data[MillFirebaseInput.fn08l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desfn08l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desfn08l2]),
                                    InvoiceItem(
                                        no: 5,
                                        code: "BF-09",
                                        equipments: MillTittle.bagfilter,
                                        checkpoints: MillTittle.bfcf,
                                        line1: data[MillFirebaseInput.bf09l1],
                                        line2: data[MillFirebaseInput.bf09l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbf09l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbf09l2]),
                                    InvoiceItem(
                                        no: 6,
                                        code: "FN-09",
                                        equipments:
                                            "Fan " + MillTittle.bagfilter,
                                        checkpoints: MillTittle.fncf,
                                        line1: data[MillFirebaseInput.fn09l1],
                                        line2: data[MillFirebaseInput.fn09l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desfn09l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desfn09l2]),
                                    InvoiceItem(
                                        no: 7,
                                        code: "BF-10",
                                        equipments: MillTittle.bagfilter,
                                        checkpoints: MillTittle.bfcf,
                                        line1: data[MillFirebaseInput.bf10l1],
                                        line2: data[MillFirebaseInput.bf10l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbf10l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbf10l2]),
                                    InvoiceItem(
                                        no: 8,
                                        code: "FN-10",
                                        equipments:
                                            "Fan " + MillTittle.bagfilter,
                                        checkpoints: MillTittle.fncf,
                                        line1: data[MillFirebaseInput.fn10l1],
                                        line2: data[MillFirebaseInput.fn10l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desfn10l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desfn10l2]),
                                    InvoiceItem(
                                        no: 9,
                                        code: "NG-01",
                                        equipments: MillTittle.neddle,
                                        checkpoints: MillTittle.neddlecf,
                                        line1: data[MillFirebaseInput.ng01l1],
                                        line2: data[MillFirebaseInput.ng01l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desng01l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desng01l2]),
                                    InvoiceItem(
                                        no: 10,
                                        code: "NG-02",
                                        equipments: MillTittle.neddle,
                                        checkpoints: MillTittle.neddlecf,
                                        line1: data[MillFirebaseInput.ng02l1],
                                        line2: data[MillFirebaseInput.ng02l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desng02l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desng02l2]),
                                    InvoiceItem(
                                        no: 11,
                                        code: "NG-03",
                                        equipments: MillTittle.neddle,
                                        checkpoints: MillTittle.neddlecf,
                                        line1: data[MillFirebaseInput.ng03l1],
                                        line2: data[MillFirebaseInput.ng03l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desng03l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desng03l2]),
                                    InvoiceItem(
                                        no: 12,
                                        code: "NG-04",
                                        equipments: MillTittle.neddle,
                                        checkpoints: MillTittle.neddlecf,
                                        line1: data[MillFirebaseInput.ng04l1],
                                        line2: data[MillFirebaseInput.ng04l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desng04l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desng04l2]),
                                    InvoiceItem(
                                        no: 13,
                                        code: "WF-01",
                                        equipments:
                                            MillTittle.wf + " Limestone",
                                        checkpoints: MillTittle.wfcf,
                                        line1: data[MillFirebaseInput.wf01l1],
                                        line2: data[MillFirebaseInput.wf01l2],
                                        remarksline1:
                                            data[MillFirebaseInput.deswf01l1],
                                        remarksline2:
                                            data[MillFirebaseInput.deswf01l2]),
                                    InvoiceItem(
                                        no: 14,
                                        code: "WF-02",
                                        equipments: MillTittle.wf + " Clinker",
                                        checkpoints: MillTittle.wfcf,
                                        line1: data[MillFirebaseInput.wf02l1],
                                        line2: data[MillFirebaseInput.wf02l2],
                                        remarksline1:
                                            data[MillFirebaseInput.deswf02l1],
                                        remarksline2:
                                            data[MillFirebaseInput.deswf02l2]),
                                    InvoiceItem(
                                        no: 15,
                                        code: "WF-03",
                                        equipments: MillTittle.wf + " Trass",
                                        checkpoints: MillTittle.wfcf,
                                        line1: data[MillFirebaseInput.wf03l1],
                                        line2: data[MillFirebaseInput.wf03l2],
                                        remarksline1:
                                            data[MillFirebaseInput.deswf03l1],
                                        remarksline2:
                                            data[MillFirebaseInput.deswf03l2]),
                                    InvoiceItem(
                                        no: 16,
                                        code: "WF-04",
                                        equipments: MillTittle.wf + " Gypsum",
                                        checkpoints: MillTittle.wfcf,
                                        line1: data[MillFirebaseInput.wf04l1],
                                        line2: data[MillFirebaseInput.wf04l2],
                                        remarksline1:
                                            data[MillFirebaseInput.deswf04l1],
                                        remarksline2:
                                            data[MillFirebaseInput.deswf04l2]),
                                    InvoiceItem(
                                        no: 17,
                                        code: "BC-01",
                                        equipments: MillTittle.bc,
                                        checkpoints: MillTittle.bccf,
                                        line1: data[MillFirebaseInput.bc01l1],
                                        line2: data[MillFirebaseInput.bc01l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbc01l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbc01l2]),
                                    InvoiceItem(
                                        no: 18,
                                        code: "BC-02",
                                        equipments: MillTittle.bc,
                                        checkpoints: MillTittle.bccf,
                                        line1: data[MillFirebaseInput.bc02l1],
                                        line2: data[MillFirebaseInput.bc02l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbc02l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbc02l2]),
                                    InvoiceItem(
                                        no: 19,
                                        code: "BF-02",
                                        equipments: MillTittle.bagfilter,
                                        checkpoints: MillTittle.bfcf,
                                        line1: data[MillFirebaseInput.bf02l1],
                                        line2: data[MillFirebaseInput.bf02l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbf02l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbf02l2]),
                                    InvoiceItem(
                                        no: 20,
                                        code: "FN-02",
                                        equipments:
                                            "Fan " + MillTittle.bagfilter,
                                        checkpoints: MillTittle.fncf,
                                        line1: data[MillFirebaseInput.fn02l1],
                                        line2: data[MillFirebaseInput.fn02l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desfn02l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desfn02l2]),
                                    InvoiceItem(
                                        no: 21,
                                        code: "BF-03",
                                        equipments: MillTittle.bagfilter,
                                        checkpoints: MillTittle.bfcf,
                                        line1: data[MillFirebaseInput.bf03l1],
                                        line2: data[MillFirebaseInput.bf03l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbf03l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbf03l2]),
                                    InvoiceItem(
                                        no: 22,
                                        code: "FN-03",
                                        equipments:
                                            "Fan " + MillTittle.bagfilter,
                                        checkpoints: MillTittle.fncf,
                                        line1: data[MillFirebaseInput.fn03l1],
                                        line2: data[MillFirebaseInput.fn03l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desfn03l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desfn03l2]),
                                    InvoiceItem(
                                        no: 23,
                                        code: "BF-04",
                                        equipments: MillTittle.bagfilter,
                                        checkpoints: MillTittle.bfcf,
                                        line1: data[MillFirebaseInput.bf04l1],
                                        line2: data[MillFirebaseInput.bf04l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbf04l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbf04l2]),
                                    InvoiceItem(
                                        no: 24,
                                        code: "FN-04",
                                        equipments:
                                            "Fan " + MillTittle.bagfilter,
                                        checkpoints: MillTittle.fncf,
                                        line1: data[MillFirebaseInput.fn04l1],
                                        line2: data[MillFirebaseInput.fn04l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desfn04l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desfn04l2]),
                                    InvoiceItem(
                                        no: 25,
                                        code: "BF-05",
                                        equipments: MillTittle.bagfilter,
                                        checkpoints: MillTittle.bfcf,
                                        line1: data[MillFirebaseInput.bf05l1],
                                        line2: data[MillFirebaseInput.bf05l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbf05l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbf05l2]),
                                    InvoiceItem(
                                        no: 26,
                                        code: "FN-05",
                                        equipments:
                                            "Fan " + MillTittle.bagfilter,
                                        checkpoints: MillTittle.fncf,
                                        line1: data[MillFirebaseInput.fn05l1],
                                        line2: data[MillFirebaseInput.fn05l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desfn05l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desfn05l2]),
                                    InvoiceItem(
                                        no: 27,
                                        code: "BF-06",
                                        equipments: MillTittle.bagfilter,
                                        checkpoints: MillTittle.bfcf,
                                        line1: data[MillFirebaseInput.bf06l1],
                                        line2: data[MillFirebaseInput.bf06l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbf06l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbf06l2]),
                                    InvoiceItem(
                                        no: 28,
                                        code: "FN-06",
                                        equipments:
                                            "Fan " + MillTittle.bagfilter,
                                        checkpoints: MillTittle.fncf,
                                        line1: data[MillFirebaseInput.fn06l1],
                                        line2: data[MillFirebaseInput.fn06l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desfn06l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desfn06l2]),
                                    InvoiceItem(
                                        no: 29,
                                        code: "SC-01",
                                        equipments: MillTittle.sc,
                                        checkpoints: MillTittle.sccf,
                                        line1: data[MillFirebaseInput.sc01l1],
                                        line2: data[MillFirebaseInput.sc01l2],
                                        remarksline1:
                                            data[MillFirebaseInput.dessc01l1],
                                        remarksline2:
                                            data[MillFirebaseInput.dessc01l2]),
                                    InvoiceItem(
                                        no: 30,
                                        code: "SC-02",
                                        equipments: MillTittle.sc,
                                        checkpoints: MillTittle.sccf,
                                        line1: data[MillFirebaseInput.sc02l1],
                                        line2: data[MillFirebaseInput.sc02l2],
                                        remarksline1:
                                            data[MillFirebaseInput.dessc02l1],
                                        remarksline2:
                                            data[MillFirebaseInput.dessc02l2]),
                                    InvoiceItem(
                                        no: 31,
                                        code: "SC-03",
                                        equipments: MillTittle.sc,
                                        checkpoints: MillTittle.sccf,
                                        line1: data[MillFirebaseInput.sc03l1],
                                        line2: data[MillFirebaseInput.sc03l2],
                                        remarksline1:
                                            data[MillFirebaseInput.dessc03l1],
                                        remarksline2:
                                            data[MillFirebaseInput.dessc03l2]),
                                    InvoiceItem(
                                        no: 32,
                                        code: "BE-01",
                                        equipments: MillTittle.be,
                                        checkpoints: MillTittle.becf,
                                        line1: data[MillFirebaseInput.be01l1],
                                        line2: data[MillFirebaseInput.be01l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbe01l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbe01l2]),
                                    InvoiceItem(
                                        no: 33,
                                        code: "BM-01",
                                        equipments: MillTittle.bm,
                                        checkpoints: MillTittle.bmcf,
                                        line1: data[MillFirebaseInput.bm01l1],
                                        line2: data[MillFirebaseInput.bm01l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbm01l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbm01l2]),
                                    InvoiceItem(
                                        no: 34,
                                        code: "LQ-01",
                                        equipments: MillTittle.lq,
                                        checkpoints: MillTittle.lqcf,
                                        line1: data[MillFirebaseInput.lq01l1],
                                        line2: data[MillFirebaseInput.lq01l2],
                                        remarksline1:
                                            data[MillFirebaseInput.deslq01l1],
                                        remarksline2:
                                            data[MillFirebaseInput.deslq01l2]),
                                    InvoiceItem(
                                        no: 35,
                                        code: "LQ-02",
                                        equipments: MillTittle.lq,
                                        checkpoints: MillTittle.lqcf,
                                        line1: data[MillFirebaseInput.lq02l1],
                                        line2: data[MillFirebaseInput.lq02l2],
                                        remarksline1:
                                            data[MillFirebaseInput.deslq02l1],
                                        remarksline2:
                                            data[MillFirebaseInput.deslq02l2]),
                                    InvoiceItem(
                                        no: 36,
                                        code: "SR-01",
                                        equipments: MillTittle.sr,
                                        checkpoints: MillTittle.srcf,
                                        line1: data[MillFirebaseInput.sr01l1],
                                        line2: data[MillFirebaseInput.sr01l2],
                                        remarksline1:
                                            data[MillFirebaseInput.dessr01l1],
                                        remarksline2:
                                            data[MillFirebaseInput.dessr01l2]),
                                    InvoiceItem(
                                        no: 37,
                                        code: "BF-01",
                                        equipments: MillTittle.bagfilter,
                                        checkpoints: MillTittle.bfcf,
                                        line1: data[MillFirebaseInput.bf01l1],
                                        line2: data[MillFirebaseInput.bf01l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desbf01l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desbf01l2]),
                                    InvoiceItem(
                                        no: 38,
                                        code: "FN-01",
                                        equipments:
                                            "Fan " + MillTittle.bagfilter,
                                        checkpoints: MillTittle.fncf,
                                        line1: data[MillFirebaseInput.fn01l1],
                                        line2: data[MillFirebaseInput.fn01l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desfn01l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desfn01l2]),
                                    InvoiceItem(
                                        no: 39,
                                        code: "RF-01",
                                        equipments: MillTittle.rf,
                                        checkpoints: MillTittle.rfcf,
                                        line1: data[MillFirebaseInput.rf01l1],
                                        line2: data[MillFirebaseInput.rf01l2],
                                        remarksline1:
                                            data[MillFirebaseInput.desrf01l1],
                                        remarksline2:
                                            data[MillFirebaseInput.desrf01l2]),
                                    InvoiceItem(
                                      no: 40,
                                      code: "PP#",
                                      equipments: MillTittle.pp,
                                      checkpoints: MillTittle.ppcf,
                                      line1: data[MillFirebaseInput.pp1],
                                      line2: data[MillFirebaseInput.pp2],
                                      remarksline1:
                                          data[MillFirebaseInput.despp1],
                                      remarksline2:
                                          data[MillFirebaseInput.despp2],
                                    ),
                                    InvoiceItem(
                                      no: 41,
                                      code: "Silo 1",
                                      equipments: MillTittle.sl,
                                      checkpoints: MillTittle.slcf,
                                      line1: data[MillFirebaseInput.silo1],
                                      line2: false,
                                      remarksline1:
                                          data[MillFirebaseInput.dessilo1],
                                      remarksline2: " ",
                                    ),
                                    InvoiceItem(
                                      no: 42,
                                      code: "Silo 2",
                                      equipments: MillTittle.sl,
                                      checkpoints: MillTittle.slcf,
                                      line1: data[MillFirebaseInput.silo2],
                                      line2: false,
                                      remarksline1:
                                          data[MillFirebaseInput.dessilo2],
                                      remarksline2: " ",
                                    ),
                                    InvoiceItem(
                                      no: 43,
                                      code: "Silo 3",
                                      equipments: MillTittle.sl,
                                      checkpoints: MillTittle.slcf,
                                      line1: data[MillFirebaseInput.silo3],
                                      line2: false,
                                      remarksline1:
                                          data[MillFirebaseInput.dessilo3],
                                      remarksline2: " ",
                                    ),
                                    InvoiceItem(
                                      no: 44,
                                      code: "BF-01",
                                      equipments: MillTittle.bagfilter,
                                      checkpoints: MillTittle.bfsl,
                                      line1: data[MillFirebaseInput.bf01],
                                      line2: false,
                                      remarksline1:
                                          data[MillFirebaseInput.desbf01],
                                      remarksline2: " ",
                                    ),
                                    InvoiceItem(
                                      no: 45,
                                      code: "BF-02",
                                      equipments: MillTittle.bagfilter,
                                      checkpoints: MillTittle.bfsl,
                                      line1: data[MillFirebaseInput.bf02],
                                      line2: false,
                                      remarksline1:
                                          data[MillFirebaseInput.desbf02],
                                      remarksline2: " ",
                                    ),
                                    InvoiceItem(
                                      no: 46,
                                      code: "BF-03",
                                      equipments: MillTittle.bagfilter,
                                      checkpoints: MillTittle.bfsl,
                                      line1: data[MillFirebaseInput.bf03],
                                      line2: false,
                                      remarksline1:
                                          data[MillFirebaseInput.desbf03],
                                      remarksline2: " ",
                                    ),
                                    InvoiceItem(
                                      no: 47,
                                      code: "HG-01",
                                      equipments: MillTittle.hg,
                                      checkpoints: MillTittle.hgcf,
                                      line1: data[MillFirebaseInput.hg01],
                                      line2: false,
                                      remarksline1:
                                          data[MillFirebaseInput.deshg01],
                                      remarksline2: " ",
                                    ),
                                  ],
                                );
                                final pdfFile =
                                    await PdfPageApiMill.generate(invoice);
                                PdfDetailApi.openFile(pdfFile);
                              },
                            ),
                          ),
                          // Divider(height: 1, color: Color(0xff001f30)),
                        ],
                      );
                    }
                    return Container();
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
