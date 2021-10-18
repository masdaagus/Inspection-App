import 'package:Inspection/config/palette.dart';
import 'package:Inspection/config/tittle.dart';
import 'package:Inspection/controller/controller.dart';
import 'package:Inspection/pages/packer/controller/packer_cloud.dart';
import 'package:Inspection/pages/packer/models/packer.dart';
import 'package:Inspection/pages/show-pdf/packer/pdf_detail.dart';
import 'package:Inspection/service/pdf_helper/api/detail_api.dart';
import 'package:Inspection/service/pdf_helper/models/model_pdf_packer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PackerHistory extends StatelessWidget {
  const PackerHistory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PackerCloudController controller = PackerCloudController();
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder<QuerySnapshot<Object>>(
            future: controller.getData(),
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
                        .parse(data[PackerFields.time]);
                    final ctrl = Get.put(Controller());

                    if (data[PackerFields.userName] == ctrl.userName) {
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
                                    "${f.format(date)}#${data[PackerFields.shift]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    data[PackerFields.userName],
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
                                final invoice1 = InvoicePacker(
                                  name: data[PackerFields.userName],
                                  id: data[PackerFields.idUser],
                                  shift: data[PackerFields.shift],
                                  date: f.format(date),
                                  items: [
                                    InvoiceItem(
                                      no: 1,
                                      code: 'SG-01',
                                      equipments: PackerTittle.eqsg01,
                                      checkpoints: PackerTittle.chsg01,
                                      line1: data[PackerFields.sg011],
                                      line2: data[PackerFields.sg012],
                                      line3: data[PackerFields.sg013],
                                      remarksline1: data[PackerFields.dessg011],
                                      remarksline2: data[PackerFields.dessg012],
                                      remarksline3: data[PackerFields.dessg013],
                                    ),
                                    InvoiceItem(
                                      no: 2,
                                      code: 'PG-01',
                                      equipments: PackerTittle.eqpg01,
                                      checkpoints: PackerTittle.chpg01,
                                      line1: data[PackerFields.pg011],
                                      line2: data[PackerFields.pg012],
                                      line3: data[PackerFields.pg013],
                                      remarksline1: data[PackerFields.despg011],
                                      remarksline2: data[PackerFields.despg012],
                                      remarksline3: data[PackerFields.despg013],
                                    ),
                                    InvoiceItem(
                                      no: 3,
                                      code: 'AS-01',
                                      equipments: PackerTittle.eqas01,
                                      checkpoints: PackerTittle.chas01,
                                      line1: data[PackerFields.as011],
                                      line2: data[PackerFields.as012],
                                      line3: data[PackerFields.as013],
                                      remarksline1: data[PackerFields.desas011],
                                      remarksline2: data[PackerFields.desas012],
                                      remarksline3: data[PackerFields.desas013],
                                    ),
                                    InvoiceItem(
                                      no: 4,
                                      code: 'AS-02',
                                      equipments: PackerTittle.eqas02,
                                      checkpoints: PackerTittle.chas02,
                                      line1: data[PackerFields.as021],
                                      line2: data[PackerFields.as022],
                                      line3: data[PackerFields.as023],
                                      remarksline1: data[PackerFields.desas021],
                                      remarksline2: data[PackerFields.desas022],
                                      remarksline3: data[PackerFields.desas023],
                                    ),
                                    InvoiceItem(
                                      no: 5,
                                      code: 'BL#',
                                      equipments: PackerTittle.eqbl,
                                      checkpoints: PackerTittle.chbl,
                                      line1: data[PackerFields.bl1],
                                      line2: data[PackerFields.bl2],
                                      line3: data[PackerFields.bl3],
                                      remarksline1: data[PackerFields.desas021],
                                      remarksline2: data[PackerFields.desas022],
                                      remarksline3: data[PackerFields.desas023],
                                    ),
                                  ],
                                );
                                final invoice2 = InvoicePacker(
                                  name: null,
                                  id: null,
                                  shift: null,
                                  date: null,
                                  items: [
                                    InvoiceItem(
                                        no: 6,
                                        code: "BE-01",
                                        equipments: PackerTittle.eqbe0161,
                                        checkpoints: PackerTittle.chbe0161,
                                        line1: data[PackerFields.be01611],
                                        line2: data[PackerFields.be01612],
                                        remarksline1:
                                            data[PackerFields.desbe01611],
                                        remarksline2:
                                            data[PackerFields.desbe01612]),
                                    InvoiceItem(
                                        no: 7,
                                        code: "AS-03",
                                        equipments: PackerTittle.eqas03,
                                        checkpoints: PackerTittle.chas03,
                                        line1: data[PackerFields.as031],
                                        line2: data[PackerFields.as032],
                                        remarksline1:
                                            data[PackerFields.desas031],
                                        remarksline2:
                                            data[PackerFields.desas032]),
                                    InvoiceItem(
                                        no: 8,
                                        code: "PG-02",
                                        equipments: PackerTittle.eqpg02,
                                        checkpoints: PackerTittle.chpg02,
                                        line1: data[PackerFields.pg021],
                                        line2: data[PackerFields.pg022],
                                        remarksline1:
                                            data[PackerFields.despg021],
                                        remarksline2:
                                            data[PackerFields.despg022]),
                                    InvoiceItem(
                                        no: 9,
                                        code: "PG-03",
                                        equipments: PackerTittle.eqpg03,
                                        checkpoints: PackerTittle.chpg03,
                                        line1: data[PackerFields.pg031],
                                        line2: data[PackerFields.pg032],
                                        remarksline1:
                                            data[PackerFields.despg031],
                                        remarksline2:
                                            data[PackerFields.despg032]),
                                    InvoiceItem(
                                        no: 10,
                                        code: "BF#",
                                        equipments: PackerTittle.eqbf,
                                        checkpoints: PackerTittle.chbf,
                                        line1: data[PackerFields.bf1],
                                        line2: data[PackerFields.bf2],
                                        remarksline1: data[PackerFields.desbf1],
                                        remarksline2:
                                            data[PackerFields.desbf2]),
                                    InvoiceItem(
                                        no: 11,
                                        code: "VS-01",
                                        equipments: PackerTittle.eqvs01,
                                        checkpoints: PackerTittle.chvs01,
                                        line1: data[PackerFields.vs011],
                                        line2: data[PackerFields.vs012],
                                        remarksline1:
                                            data[PackerFields.desvs011],
                                        remarksline2:
                                            data[PackerFields.desvs012]),
                                    InvoiceItem(
                                        no: 12,
                                        code: "BE-01",
                                        equipments: PackerTittle.eqbe0166,
                                        checkpoints: PackerTittle.chbe0166,
                                        line1: data[PackerFields.be01661],
                                        line2: data[PackerFields.be01662],
                                        remarksline1:
                                            data[PackerFields.desbe01661],
                                        remarksline2:
                                            data[PackerFields.desbe01662]),
                                    InvoiceItem(
                                        no: 13,
                                        code: "SC-01",
                                        equipments: PackerTittle.eqsc01,
                                        checkpoints: PackerTittle.chsc01,
                                        line1: data[PackerFields.sc011],
                                        line2: data[PackerFields.sc012],
                                        remarksline1:
                                            data[PackerFields.dessc011],
                                        remarksline2:
                                            data[PackerFields.dessc012]),
                                    InvoiceItem(
                                        no: 14,
                                        code: "3B#",
                                        equipments: PackerTittle.eqbb,
                                        checkpoints: PackerTittle.chbb,
                                        line1: data[PackerFields.bb1],
                                        line2: data[PackerFields.bb2],
                                        remarksline1: data[PackerFields.desbb1],
                                        remarksline2:
                                            data[PackerFields.desbb2]),
                                    InvoiceItem(
                                        no: 15,
                                        code: "AS#",
                                        equipments: PackerTittle.eqasb,
                                        checkpoints: PackerTittle.chasb,
                                        line1: data[PackerFields.asb1],
                                        line2: data[PackerFields.asb2],
                                        remarksline1:
                                            data[PackerFields.desasb1],
                                        remarksline2:
                                            data[PackerFields.desasb2]),
                                    InvoiceItem(
                                        no: 16,
                                        code: "LA#",
                                        equipments: PackerTittle.eqla,
                                        checkpoints: PackerTittle.chla,
                                        line1: data[PackerFields.la1],
                                        line2: data[PackerFields.la2],
                                        remarksline1: data[PackerFields.desla1],
                                        remarksline2:
                                            data[PackerFields.desla2]),
                                    InvoiceItem(
                                        no: 17,
                                        code: "3B-01",
                                        equipments: PackerTittle.eqb3b,
                                        checkpoints: PackerTittle.chb3b,
                                        line1: data[PackerFields.b3b1],
                                        line2: data[PackerFields.b3b2],
                                        remarksline1:
                                            data[PackerFields.desb3b1],
                                        remarksline2:
                                            data[PackerFields.desb3b2]),
                                    InvoiceItem(
                                        no: 18,
                                        code: "BF-01",
                                        equipments: PackerTittle.eqbf01,
                                        checkpoints: PackerTittle.chbf01,
                                        line1: data[PackerFields.bf011],
                                        line2: data[PackerFields.bf012],
                                        remarksline1:
                                            data[PackerFields.desbf011],
                                        remarksline2:
                                            data[PackerFields.desbf012]),
                                    InvoiceItem(
                                        no: 19,
                                        code: "RF-01",
                                        equipments: PackerTittle.eqrf01,
                                        checkpoints: PackerTittle.chrf01,
                                        line1: data[PackerFields.rf011],
                                        line2: data[PackerFields.rf012],
                                        remarksline1:
                                            data[PackerFields.desrf011],
                                        remarksline2:
                                            data[PackerFields.desrf012]),
                                    InvoiceItem(
                                        no: 20,
                                        code: "SC-03",
                                        equipments: PackerTittle.eqsc03,
                                        checkpoints: PackerTittle.chsc03,
                                        line1: data[PackerFields.sc031],
                                        line2: data[PackerFields.sc032],
                                        remarksline1:
                                            data[PackerFields.dessc031],
                                        remarksline2:
                                            data[PackerFields.dessc032]),
                                    InvoiceItem(
                                        no: 21,
                                        code: "SC-04",
                                        equipments: PackerTittle.eqsc04,
                                        checkpoints: PackerTittle.chsc04,
                                        line1: data[PackerFields.sc041],
                                        line2: data[PackerFields.sc042],
                                        remarksline1:
                                            data[PackerFields.dessc041],
                                        remarksline2:
                                            data[PackerFields.dessc042]),
                                    InvoiceItem(
                                        no: 22,
                                        code: "AS-04",
                                        equipments: PackerTittle.eqas04,
                                        checkpoints: PackerTittle.chas04,
                                        line1: data[PackerFields.as041],
                                        line2: data[PackerFields.as042],
                                        remarksline1:
                                            data[PackerFields.desas041],
                                        remarksline2:
                                            data[PackerFields.desas042]),
                                    InvoiceItem(
                                        no: 23,
                                        code: "FN-01",
                                        equipments: PackerTittle.eqfn01,
                                        checkpoints: PackerTittle.chfn01,
                                        line1: data[PackerFields.fn011],
                                        line2: data[PackerFields.fn012],
                                        remarksline1:
                                            data[PackerFields.desfn011],
                                        remarksline2:
                                            data[PackerFields.desfn012]),
                                    InvoiceItem(
                                        no: 24,
                                        code: "PM-01",
                                        equipments: PackerTittle.eqpm01,
                                        checkpoints: PackerTittle.chpm01,
                                        line1: data[PackerFields.pm011],
                                        line2: data[PackerFields.pm012],
                                        remarksline1:
                                            data[PackerFields.despm011],
                                        remarksline2:
                                            data[PackerFields.despm012]),
                                    InvoiceItem(
                                        no: 25,
                                        code: "BC-01",
                                        equipments: PackerTittle.eqbc01,
                                        checkpoints: PackerTittle.chbc01,
                                        line1: data[PackerFields.bc011],
                                        line2: data[PackerFields.bc012],
                                        remarksline1:
                                            data[PackerFields.desbc011],
                                        remarksline2:
                                            data[PackerFields.desbc012]),
                                    InvoiceItem(
                                        no: 26,
                                        code: "BN-01",
                                        equipments: PackerTittle.eqbn01,
                                        checkpoints: PackerTittle.chbn01,
                                        line1: data[PackerFields.bn011],
                                        line2: data[PackerFields.bn012],
                                        remarksline1:
                                            data[PackerFields.desbn011],
                                        remarksline2:
                                            data[PackerFields.desbn012]),
                                    InvoiceItem(
                                        no: 27,
                                        code: "BW-01",
                                        equipments: PackerTittle.eqbw01,
                                        checkpoints: PackerTittle.chbw01,
                                        line1: data[PackerFields.bw011],
                                        line2: data[PackerFields.bw012],
                                        remarksline1:
                                            data[PackerFields.desbw011],
                                        remarksline2:
                                            data[PackerFields.desbw012]),
                                    InvoiceItem(
                                        no: 28,
                                        code: "RB-01",
                                        equipments: PackerTittle.eqrb01,
                                        checkpoints: PackerTittle.chrb01,
                                        line1: data[PackerFields.rb011],
                                        line2: data[PackerFields.rb012],
                                        remarksline1:
                                            data[PackerFields.desrb011],
                                        remarksline2:
                                            data[PackerFields.desrb012]),
                                    InvoiceItem(
                                        no: 29,
                                        code: "IP#",
                                        equipments: PackerTittle.eqip,
                                        checkpoints: PackerTittle.chip,
                                        line1: data[PackerFields.ip1],
                                        line2: data[PackerFields.ip2],
                                        remarksline1: data[PackerFields.desip1],
                                        remarksline2:
                                            data[PackerFields.desip2]),
                                    InvoiceItem(
                                        no: 30,
                                        code: "SC-02",
                                        equipments: PackerTittle.eqsc02,
                                        checkpoints: PackerTittle.chsc02,
                                        line1: data[PackerFields.sc021],
                                        line2: data[PackerFields.sc022],
                                        remarksline1:
                                            data[PackerFields.dessc021],
                                        remarksline2:
                                            data[PackerFields.dessc022]),
                                    InvoiceItem(
                                        no: 31,
                                        code: "BC-02",
                                        equipments: PackerTittle.eqbc02,
                                        checkpoints: PackerTittle.chbc02,
                                        line1: data[PackerFields.bc021],
                                        line2: data[PackerFields.bc022],
                                        remarksline1:
                                            data[PackerFields.desbc021],
                                        remarksline2:
                                            data[PackerFields.desbc022]),
                                    InvoiceItem(
                                        no: 32,
                                        code: "BD-01",
                                        equipments: PackerTittle.eqbd01,
                                        checkpoints: PackerTittle.chbd01,
                                        line1: data[PackerFields.bd011],
                                        line2: data[PackerFields.bd012],
                                        remarksline1:
                                            data[PackerFields.desbd011],
                                        remarksline2:
                                            data[PackerFields.desbd012]),
                                    InvoiceItem(
                                        no: 33,
                                        code: "BC-01",
                                        equipments: PackerTittle.eqtbc01,
                                        checkpoints: PackerTittle.chtbc01,
                                        line1: data[PackerFields.tbc011],
                                        line2: data[PackerFields.tbc012],
                                        remarksline1:
                                            data[PackerFields.destbc011],
                                        remarksline2:
                                            data[PackerFields.destbc012]),
                                    InvoiceItem(
                                        no: 34,
                                        code: "BC-02",
                                        equipments: PackerTittle.eqlbc02,
                                        checkpoints: PackerTittle.chlbc02,
                                        line1: data[PackerFields.lbc021],
                                        line2: data[PackerFields.lbc022],
                                        remarksline1:
                                            data[PackerFields.deslbc021],
                                        remarksline2:
                                            data[PackerFields.deslbc022]),
                                    InvoiceItem(
                                        no: 35,
                                        code: "BC-03",
                                        equipments: PackerTittle.eqtbc03,
                                        checkpoints: PackerTittle.chtbc03,
                                        line1: data[PackerFields.tbc031],
                                        line2: data[PackerFields.tbc032],
                                        remarksline1:
                                            data[PackerFields.destbc031],
                                        remarksline2:
                                            data[PackerFields.destbc032]),
                                    InvoiceItem(
                                        no: 36,
                                        code: "BC-04",
                                        equipments: PackerTittle.eqlbc04,
                                        checkpoints: PackerTittle.chlbc04,
                                        line1: data[PackerFields.lbc041],
                                        line2: data[PackerFields.lbc042],
                                        remarksline1:
                                            data[PackerFields.deslbc041],
                                        remarksline2:
                                            data[PackerFields.deslbc042]),
                                    InvoiceItem(
                                        no: 37,
                                        code: "TK#",
                                        equipments: PackerTittle.eqtk,
                                        checkpoints: PackerTittle.chtk,
                                        line1: data[PackerFields.tk1],
                                        line2: data[PackerFields.tk2],
                                        remarksline1: data[PackerFields.destk1],
                                        remarksline2:
                                            data[PackerFields.destk2]),
                                    InvoiceItem(
                                        no: 38,
                                        code: "DR#",
                                        equipments: PackerTittle.eqdr,
                                        checkpoints: PackerTittle.chdr,
                                        line1: data[PackerFields.dr1],
                                        line2: data[PackerFields.dr2],
                                        remarksline1: data[PackerFields.desdr1],
                                        remarksline2:
                                            data[PackerFields.desdr2]),
                                  ],
                                );

                                final pdfFile = await PdfPageApiPacker.generate(
                                    invoice1,
                                    invoice2: invoice2);
                                PdfDetailApi.openFile(pdfFile);
                              },
                            ),
                          )
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
