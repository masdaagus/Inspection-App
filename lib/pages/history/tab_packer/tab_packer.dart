import 'package:Inspection/Database/database.dart';
import 'package:Inspection/pages/packer/input/input.dart';
import 'package:Inspection/pages/packer/models/packer_model.dart';
import 'package:Inspection/service/pdf_helper/models/model_pdf_packer.dart';
import 'package:Inspection/pages/show-pdf/packer/pdf_detail.dart';
import 'package:Inspection/config/palette.dart';
import 'package:Inspection/config/tittle.dart';
import 'package:Inspection/service/pdf_helper/api/detail_api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class PackerHistory extends StatelessWidget {
  final f = new DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Get.to(() => InputPacker());
        },
      ),
      backgroundColor: Palette.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
            future: DatabaseMill.instance.readAllPacker(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container();
              } else {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Packer packer = snapshot.data[index];

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
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 4,
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${f.format(packer.createTime)}#${packer.shift}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  packer.userName,
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
                                        print("masda");
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            dense: true,
                            onTap: () async {
                              final invoice1 = InvoicePacker(
                                name: packer.userName,
                                id: packer.idUser,
                                shift: packer.shift,
                                date: f.format(packer.createTime),
                                items: [
                                  InvoiceItem(
                                    no: 1,
                                    code: 'SG-01',
                                    equipments: PackerTittle.eqsg01,
                                    checkpoints: PackerTittle.chsg01,
                                    line1: packer.sg011,
                                    line2: packer.sg012,
                                    line3: packer.sg013,
                                    remarksline1: packer.dessg011,
                                    remarksline2: packer.dessg012,
                                    remarksline3: packer.dessg013,
                                  ),
                                  InvoiceItem(
                                    no: 2,
                                    code: 'PG-01',
                                    equipments: PackerTittle.eqpg01,
                                    checkpoints: PackerTittle.chpg01,
                                    line1: packer.pg011,
                                    line2: packer.pg012,
                                    line3: packer.pg013,
                                    remarksline1: packer.despg011,
                                    remarksline2: packer.despg012,
                                    remarksline3: packer.despg013,
                                  ),
                                  InvoiceItem(
                                    no: 3,
                                    code: 'AS-01',
                                    equipments: PackerTittle.eqas01,
                                    checkpoints: PackerTittle.chas01,
                                    line1: packer.as011,
                                    line2: packer.as012,
                                    line3: packer.as013,
                                    remarksline1: packer.desas011,
                                    remarksline2: packer.desas012,
                                    remarksline3: packer.desas013,
                                  ),
                                  InvoiceItem(
                                    no: 4,
                                    code: 'AS-02',
                                    equipments: PackerTittle.eqas02,
                                    checkpoints: PackerTittle.chas02,
                                    line1: packer.as021,
                                    line2: packer.as022,
                                    line3: packer.as023,
                                    remarksline1: packer.desas021,
                                    remarksline2: packer.desas022,
                                    remarksline3: packer.desas023,
                                  ),
                                  InvoiceItem(
                                    no: 5,
                                    code: 'BL#',
                                    equipments: PackerTittle.eqbl,
                                    checkpoints: PackerTittle.chbl,
                                    line1: packer.bl1,
                                    line2: packer.bl2,
                                    line3: packer.bl3,
                                    remarksline1: packer.desas021,
                                    remarksline2: packer.desas022,
                                    remarksline3: packer.desas023,
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
                                      line1: packer.be01611,
                                      line2: packer.be01612,
                                      remarksline1: packer.desbe01611,
                                      remarksline2: packer.desbe01612),
                                  InvoiceItem(
                                      no: 7,
                                      code: "AS-03",
                                      equipments: PackerTittle.eqas03,
                                      checkpoints: PackerTittle.chas03,
                                      line1: packer.as031,
                                      line2: packer.as032,
                                      remarksline1: packer.desas031,
                                      remarksline2: packer.desas032),
                                  InvoiceItem(
                                      no: 8,
                                      code: "PG-02",
                                      equipments: PackerTittle.eqpg02,
                                      checkpoints: PackerTittle.chpg02,
                                      line1: packer.pg021,
                                      line2: packer.pg022,
                                      remarksline1: packer.despg021,
                                      remarksline2: packer.despg022),
                                  InvoiceItem(
                                      no: 9,
                                      code: "PG-03",
                                      equipments: PackerTittle.eqpg03,
                                      checkpoints: PackerTittle.chpg03,
                                      line1: packer.pg031,
                                      line2: packer.pg032,
                                      remarksline1: packer.despg031,
                                      remarksline2: packer.despg032),
                                  InvoiceItem(
                                      no: 10,
                                      code: "BF#",
                                      equipments: PackerTittle.eqbf,
                                      checkpoints: PackerTittle.chbf,
                                      line1: packer.bf1,
                                      line2: packer.bf2,
                                      remarksline1: packer.desbf1,
                                      remarksline2: packer.desbf2),
                                  InvoiceItem(
                                      no: 11,
                                      code: "VS-01",
                                      equipments: PackerTittle.eqvs01,
                                      checkpoints: PackerTittle.chvs01,
                                      line1: packer.vs011,
                                      line2: packer.vs012,
                                      remarksline1: packer.desvs011,
                                      remarksline2: packer.desvs012),
                                  InvoiceItem(
                                      no: 12,
                                      code: "BE-01",
                                      equipments: PackerTittle.eqbe0166,
                                      checkpoints: PackerTittle.chbe0166,
                                      line1: packer.be01661,
                                      line2: packer.be01662,
                                      remarksline1: packer.desbe01661,
                                      remarksline2: packer.desbe01662),
                                  InvoiceItem(
                                      no: 13,
                                      code: "SC-01",
                                      equipments: PackerTittle.eqsc01,
                                      checkpoints: PackerTittle.chsc01,
                                      line1: packer.sc011,
                                      line2: packer.sc012,
                                      remarksline1: packer.dessc011,
                                      remarksline2: packer.dessc012),
                                  InvoiceItem(
                                      no: 14,
                                      code: "3B#",
                                      equipments: PackerTittle.eqbb,
                                      checkpoints: PackerTittle.chbb,
                                      line1: packer.bb1,
                                      line2: packer.bb2,
                                      remarksline1: packer.desbb1,
                                      remarksline2: packer.desbb2),
                                  InvoiceItem(
                                      no: 15,
                                      code: "AS#",
                                      equipments: PackerTittle.eqasb,
                                      checkpoints: PackerTittle.chasb,
                                      line1: packer.asb1,
                                      line2: packer.asb2,
                                      remarksline1: packer.desasb1,
                                      remarksline2: packer.desasb2),
                                  InvoiceItem(
                                      no: 16,
                                      code: "LA#",
                                      equipments: PackerTittle.eqla,
                                      checkpoints: PackerTittle.chla,
                                      line1: packer.la1,
                                      line2: packer.la2,
                                      remarksline1: packer.desla1,
                                      remarksline2: packer.desla2),
                                  InvoiceItem(
                                      no: 17,
                                      code: "3B-01",
                                      equipments: PackerTittle.eqb3b,
                                      checkpoints: PackerTittle.chb3b,
                                      line1: packer.b3b1,
                                      line2: packer.b3b2,
                                      remarksline1: packer.desb3b1,
                                      remarksline2: packer.desb3b2),
                                  InvoiceItem(
                                      no: 18,
                                      code: "BF-01",
                                      equipments: PackerTittle.eqbf01,
                                      checkpoints: PackerTittle.chbf01,
                                      line1: packer.bf011,
                                      line2: packer.bf012,
                                      remarksline1: packer.desbf011,
                                      remarksline2: packer.desbf012),
                                  InvoiceItem(
                                      no: 19,
                                      code: "RF-01",
                                      equipments: PackerTittle.eqrf01,
                                      checkpoints: PackerTittle.chrf01,
                                      line1: packer.rf011,
                                      line2: packer.rf012,
                                      remarksline1: packer.desrf011,
                                      remarksline2: packer.desrf012),
                                  InvoiceItem(
                                      no: 20,
                                      code: "SC-03",
                                      equipments: PackerTittle.eqsc03,
                                      checkpoints: PackerTittle.chsc03,
                                      line1: packer.sc031,
                                      line2: packer.sc032,
                                      remarksline1: packer.dessc031,
                                      remarksline2: packer.dessc032),
                                  InvoiceItem(
                                      no: 21,
                                      code: "SC-04",
                                      equipments: PackerTittle.eqsc04,
                                      checkpoints: PackerTittle.chsc04,
                                      line1: packer.sc041,
                                      line2: packer.sc042,
                                      remarksline1: packer.dessc041,
                                      remarksline2: packer.dessc042),
                                  InvoiceItem(
                                      no: 22,
                                      code: "AS-04",
                                      equipments: PackerTittle.eqas04,
                                      checkpoints: PackerTittle.chas04,
                                      line1: packer.as041,
                                      line2: packer.as042,
                                      remarksline1: packer.desas041,
                                      remarksline2: packer.desas042),
                                  InvoiceItem(
                                      no: 23,
                                      code: "FN-01",
                                      equipments: PackerTittle.eqfn01,
                                      checkpoints: PackerTittle.chfn01,
                                      line1: packer.fn011,
                                      line2: packer.fn012,
                                      remarksline1: packer.desfn011,
                                      remarksline2: packer.desfn012),
                                  InvoiceItem(
                                      no: 24,
                                      code: "PM-01",
                                      equipments: PackerTittle.eqpm01,
                                      checkpoints: PackerTittle.chpm01,
                                      line1: packer.pm011,
                                      line2: packer.pm012,
                                      remarksline1: packer.despm011,
                                      remarksline2: packer.despm012),
                                  InvoiceItem(
                                      no: 25,
                                      code: "BC-01",
                                      equipments: PackerTittle.eqbc01,
                                      checkpoints: PackerTittle.chbc01,
                                      line1: packer.bc011,
                                      line2: packer.bc012,
                                      remarksline1: packer.desbc011,
                                      remarksline2: packer.desbc012),
                                  InvoiceItem(
                                      no: 26,
                                      code: "BN-01",
                                      equipments: PackerTittle.eqbn01,
                                      checkpoints: PackerTittle.chbn01,
                                      line1: packer.bn011,
                                      line2: packer.bn012,
                                      remarksline1: packer.desbn011,
                                      remarksline2: packer.desbn012),
                                  InvoiceItem(
                                      no: 27,
                                      code: "BW-01",
                                      equipments: PackerTittle.eqbw01,
                                      checkpoints: PackerTittle.chbw01,
                                      line1: packer.bw011,
                                      line2: packer.bw012,
                                      remarksline1: packer.desbw011,
                                      remarksline2: packer.desbw012),
                                  InvoiceItem(
                                      no: 28,
                                      code: "RB-01",
                                      equipments: PackerTittle.eqrb01,
                                      checkpoints: PackerTittle.chrb01,
                                      line1: packer.rb011,
                                      line2: packer.rb012,
                                      remarksline1: packer.desrb011,
                                      remarksline2: packer.desrb012),
                                  InvoiceItem(
                                      no: 29,
                                      code: "IP#",
                                      equipments: PackerTittle.eqip,
                                      checkpoints: PackerTittle.chip,
                                      line1: packer.ip1,
                                      line2: packer.ip2,
                                      remarksline1: packer.desip1,
                                      remarksline2: packer.desip2),
                                  InvoiceItem(
                                      no: 30,
                                      code: "SC-02",
                                      equipments: PackerTittle.eqsc02,
                                      checkpoints: PackerTittle.chsc02,
                                      line1: packer.sc021,
                                      line2: packer.sc022,
                                      remarksline1: packer.dessc021,
                                      remarksline2: packer.dessc022),
                                  InvoiceItem(
                                      no: 31,
                                      code: "BC-02",
                                      equipments: PackerTittle.eqbc02,
                                      checkpoints: PackerTittle.chbc02,
                                      line1: packer.bc021,
                                      line2: packer.bc022,
                                      remarksline1: packer.desbc021,
                                      remarksline2: packer.desbc022),
                                  InvoiceItem(
                                      no: 32,
                                      code: "BD-01",
                                      equipments: PackerTittle.eqbd01,
                                      checkpoints: PackerTittle.chbd01,
                                      line1: packer.bd011,
                                      line2: packer.bd012,
                                      remarksline1: packer.desbd011,
                                      remarksline2: packer.desbd012),
                                  InvoiceItem(
                                      no: 33,
                                      code: "BC-01",
                                      equipments: PackerTittle.eqtbc01,
                                      checkpoints: PackerTittle.chtbc01,
                                      line1: packer.tbc011,
                                      line2: packer.tbc012,
                                      remarksline1: packer.destbc011,
                                      remarksline2: packer.destbc012),
                                  InvoiceItem(
                                      no: 34,
                                      code: "BC-02",
                                      equipments: PackerTittle.eqlbc02,
                                      checkpoints: PackerTittle.chlbc02,
                                      line1: packer.lbc021,
                                      line2: packer.lbc022,
                                      remarksline1: packer.deslbc021,
                                      remarksline2: packer.deslbc022),
                                  InvoiceItem(
                                      no: 35,
                                      code: "BC-03",
                                      equipments: PackerTittle.eqtbc03,
                                      checkpoints: PackerTittle.chtbc03,
                                      line1: packer.tbc031,
                                      line2: packer.tbc032,
                                      remarksline1: packer.destbc031,
                                      remarksline2: packer.destbc032),
                                  InvoiceItem(
                                      no: 36,
                                      code: "BC-04",
                                      equipments: PackerTittle.eqlbc04,
                                      checkpoints: PackerTittle.chlbc04,
                                      line1: packer.lbc041,
                                      line2: packer.lbc042,
                                      remarksline1: packer.deslbc041,
                                      remarksline2: packer.deslbc042),
                                  InvoiceItem(
                                      no: 37,
                                      code: "TK#",
                                      equipments: PackerTittle.eqtk,
                                      checkpoints: PackerTittle.chtk,
                                      line1: packer.tk1,
                                      line2: packer.tk2,
                                      remarksline1: packer.destk1,
                                      remarksline2: packer.destk2),
                                  InvoiceItem(
                                      no: 38,
                                      code: "DR#",
                                      equipments: PackerTittle.eqdr,
                                      checkpoints: PackerTittle.chdr,
                                      line1: packer.dr1,
                                      line2: packer.dr2,
                                      remarksline1: packer.desdr1,
                                      remarksline2: packer.desdr2),
                                ],
                              );

                              final pdfFile = await PdfPageApiPacker.generate(
                                  invoice1,
                                  invoice2: invoice2);
                              PdfDetailApi.openFile(pdfFile);
                            },
                          ),
                        ),
                        // Divider(height: 1, color: Color(0xff001f30)),
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
