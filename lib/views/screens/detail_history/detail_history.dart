import 'package:Inspection/Database/database_mill.dart';
import 'package:Inspection/model_database/mill_model.dart';
import 'package:Inspection/views/const/const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailHistory extends StatefulWidget {
  final int idMill;
  const DetailHistory({
    Key key,
    this.idMill,
  }) : super(key: key);

  @override
  _DetailHistoryState createState() => _DetailHistoryState();
}

class _DetailHistoryState extends State<DetailHistory> {
  bool isLoading = false;
  Mill data;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  Future refresh() async {
    setState(() => isLoading = true);
    this.data = await DatabaseMill.instance.readMill(widget.idMill);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatDate = new DateFormat('dd-MM-yyyy HH:mm');
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          formatDate.format(data.createTime),
          style: TextStyle(fontSize: 13),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SafeArea(
                  child: DataTable(
                    columnSpacing: 28,
                    columns: [
                      DataColumn(label: Text("No", style: kTextstyle)),
                      DataColumn(label: Text("Code", style: kTextstyle)),
                      DataColumn(label: Text("Equipments", style: kTextstyle)),
                      DataColumn(label: Text("CHECKPOINTS", style: kTextstyle)),
                      DataColumn(label: Text("Line 1", style: kTextstyle)),
                      DataColumn(label: Text("Line 2", style: kTextstyle)),
                      DataColumn(label: Text("Remarks 1", style: kTextstyle)),
                      DataColumn(label: Text("Remarks 2", style: kTextstyle)),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text("1")),
                        DataCell(Text("BF-07")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(data.bf07l1 ? iconTrue() : iconFalse()),
                        DataCell(data.bf07l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbf07l1)),
                        DataCell(Text(data.desbf07l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("2")),
                        DataCell(Text("FN-07")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(data.fn07l1 ? iconTrue() : iconFalse()),
                        DataCell(data.fn07l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desfn07l1)),
                        DataCell(Text(data.desfn07l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("3")),
                        DataCell(Text("BF-08")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(data.bf08l1 ? iconTrue() : iconFalse()),
                        DataCell(data.bf08l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbf08l1)),
                        DataCell(Text(data.desbf08l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("4")),
                        DataCell(Text("FN-08")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(data.fn08l1 ? iconTrue() : iconFalse()),
                        DataCell(data.fn08l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desfn08l1)),
                        DataCell(Text(data.desfn08l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("5")),
                        DataCell(Text("BF-09")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(data.bf09l1 ? iconTrue() : iconFalse()),
                        DataCell(data.bf09l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbf09l1)),
                        DataCell(Text(data.desbf09l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("6")),
                        DataCell(Text("FN-09")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(data.fn09l1 ? iconTrue() : iconFalse()),
                        DataCell(data.fn09l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desfn09l1)),
                        DataCell(Text(data.desfn09l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("7")),
                        DataCell(Text("BF-10")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(data.bf10l1 ? iconTrue() : iconFalse()),
                        DataCell(data.bf10l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbf10l1)),
                        DataCell(Text(data.desbf10l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("8")),
                        DataCell(Text("FN-10")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(data.fn10l1 ? iconTrue() : iconFalse()),
                        DataCell(data.fn10l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desfn10l1)),
                        DataCell(Text(data.desfn10l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("9")),
                        DataCell(Text("NG-01")),
                        DataCell(Text(neddle)),
                        DataCell(Text(neddlecf)),
                        DataCell(data.ng01l1 ? iconTrue() : iconFalse()),
                        DataCell(data.ng01l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desng01l1)),
                        DataCell(Text(data.desng01l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("10")),
                        DataCell(Text("NG-02")),
                        DataCell(Text(neddle)),
                        DataCell(Text(neddlecf)),
                        DataCell(data.ng02l1 ? iconTrue() : iconFalse()),
                        DataCell(data.ng02l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desng02l1)),
                        DataCell(Text(data.desng02l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("11")),
                        DataCell(Text("NG-03")),
                        DataCell(Text(neddle)),
                        DataCell(Text(neddlecf)),
                        DataCell(data.ng03l1 ? iconTrue() : iconFalse()),
                        DataCell(data.ng03l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desng03l1)),
                        DataCell(Text(data.desng03l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("12")),
                        DataCell(Text("NG-04")),
                        DataCell(Text(neddle)),
                        DataCell(Text(neddlecf)),
                        DataCell(data.ng04l1 ? iconTrue() : iconFalse()),
                        DataCell(data.ng04l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desng04l1)),
                        DataCell(Text(data.desng04l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("13")),
                        DataCell(Text("WF-01")),
                        DataCell(Text(wf + " Limestone")),
                        DataCell(Text(wfcf)),
                        DataCell(data.wf01l1 ? iconTrue() : iconFalse()),
                        DataCell(data.wf01l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.deswf01l1)),
                        DataCell(Text(data.deswf01l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("14")),
                        DataCell(Text("WF-02")),
                        DataCell(Text(wf + " Clinker")),
                        DataCell(Text(wfcf)),
                        DataCell(data.wf02l1 ? iconTrue() : iconFalse()),
                        DataCell(data.wf02l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.deswf02l1)),
                        DataCell(Text(data.deswf02l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("15")),
                        DataCell(Text("WF-03")),
                        DataCell(Text(wf + " Trass")),
                        DataCell(Text(wfcf)),
                        DataCell(data.wf03l1 ? iconTrue() : iconFalse()),
                        DataCell(data.wf03l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.deswf03l1)),
                        DataCell(Text(data.deswf03l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("16")),
                        DataCell(Text("WF-04")),
                        DataCell(Text(wf + " Gypsum")),
                        DataCell(Text(wfcf)),
                        DataCell(data.wf04l1 ? iconTrue() : iconFalse()),
                        DataCell(data.wf04l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.deswf04l1)),
                        DataCell(Text(data.deswf04l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("17")),
                        DataCell(Text("BC-01")),
                        DataCell(Text(bc)),
                        DataCell(Text(bccf)),
                        DataCell(data.bc01l1 ? iconTrue() : iconFalse()),
                        DataCell(data.bc01l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbc01l1)),
                        DataCell(Text(data.desbc01l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("18")),
                        DataCell(Text("BC-02")),
                        DataCell(Text(bc)),
                        DataCell(Text(bccf)),
                        DataCell(data.bc02l1 ? iconTrue() : iconFalse()),
                        DataCell(data.bc02l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbc02l1)),
                        DataCell(Text(data.desbc02l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("19")),
                        DataCell(Text("BF-02")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(data.bf02l1 ? iconTrue() : iconFalse()),
                        DataCell(data.bf02l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbf02l1)),
                        DataCell(Text(data.desbf02l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("20")),
                        DataCell(Text("FN-02")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(data.fn02l1 ? iconTrue() : iconFalse()),
                        DataCell(data.fn02l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desfn02l1)),
                        DataCell(Text(data.desfn02l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("21")),
                        DataCell(Text("BF-03")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(data.bf03l1 ? iconTrue() : iconFalse()),
                        DataCell(data.bf03l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbf03l1)),
                        DataCell(Text(data.desbf03l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("22")),
                        DataCell(Text("FN-03")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(data.fn03l1 ? iconTrue() : iconFalse()),
                        DataCell(data.fn03l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desfn03l1)),
                        DataCell(Text(data.desfn03l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("23")),
                        DataCell(Text("BF-04")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(data.bf04l1 ? iconTrue() : iconFalse()),
                        DataCell(data.bf04l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbf04l1)),
                        DataCell(Text(data.desbf04l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("24")),
                        DataCell(Text("FN-04")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(data.fn04l1 ? iconTrue() : iconFalse()),
                        DataCell(data.fn04l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desfn04l1)),
                        DataCell(Text(data.desfn04l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("25")),
                        DataCell(Text("BF-05")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(data.bf05l1 ? iconTrue() : iconFalse()),
                        DataCell(data.bf05l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbf05l1)),
                        DataCell(Text(data.desbf05l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("26")),
                        DataCell(Text("FN-05")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(data.fn05l1 ? iconTrue() : iconFalse()),
                        DataCell(data.fn05l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desfn05l1)),
                        DataCell(Text(data.desfn05l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("27")),
                        DataCell(Text("BF-06")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(data.bf06l1 ? iconTrue() : iconFalse()),
                        DataCell(data.bf06l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbf06l1)),
                        DataCell(Text(data.desbf06l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("28")),
                        DataCell(Text("FN-06")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(data.fn06l1 ? iconTrue() : iconFalse()),
                        DataCell(data.fn06l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desfn06l1)),
                        DataCell(Text(data.desfn06l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("29")),
                        DataCell(Text("SC-01")),
                        DataCell(Text(sc)),
                        DataCell(Text(sccf)),
                        DataCell(data.sc01l1 ? iconTrue() : iconFalse()),
                        DataCell(data.sc01l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.dessc01l1)),
                        DataCell(Text(data.dessc01l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("30")),
                        DataCell(Text("SC-02")),
                        DataCell(Text(sc)),
                        DataCell(Text(sccf)),
                        DataCell(data.sc02l1 ? iconTrue() : iconFalse()),
                        DataCell(data.sc02l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.dessc02l1)),
                        DataCell(Text(data.dessc02l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("31")),
                        DataCell(Text("SC-03")),
                        DataCell(Text(sc)),
                        DataCell(Text(sccf)),
                        DataCell(data.sc03l1 ? iconTrue() : iconFalse()),
                        DataCell(data.sc03l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.dessc03l1)),
                        DataCell(Text(data.dessc03l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("32")),
                        DataCell(Text("BE-01")),
                        DataCell(Text(be)),
                        DataCell(Text(becf)),
                        DataCell(data.be01l1 ? iconTrue() : iconFalse()),
                        DataCell(data.be01l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbe01l1)),
                        DataCell(Text(data.desbe01l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("33")),
                        DataCell(Text("BM-01")),
                        DataCell(Text(bm)),
                        DataCell(Text(bmcf)),
                        DataCell(data.bm01l1 ? iconTrue() : iconFalse()),
                        DataCell(data.bm01l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbm01l1)),
                        DataCell(Text(data.desbm01l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("34")),
                        DataCell(Text("LQ-01")),
                        DataCell(Text(lq)),
                        DataCell(Text(lqcf)),
                        DataCell(data.lq01l1 ? iconTrue() : iconFalse()),
                        DataCell(data.lq01l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.deslq01l1)),
                        DataCell(Text(data.deslq01l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("35")),
                        DataCell(Text("LQ-02")),
                        DataCell(Text(lq)),
                        DataCell(Text(lqcf)),
                        DataCell(data.lq02l1 ? iconTrue() : iconFalse()),
                        DataCell(data.lq02l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.deslq02l1)),
                        DataCell(Text(data.deslq02l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("36")),
                        DataCell(Text("SR-01")),
                        DataCell(Text(sr)),
                        DataCell(Text(srcf)),
                        DataCell(data.sr01l1 ? iconTrue() : iconFalse()),
                        DataCell(data.sr01l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.dessr01l1)),
                        DataCell(Text(data.dessr01l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("37")),
                        DataCell(Text("BF-01")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(data.bf01l1 ? iconTrue() : iconFalse()),
                        DataCell(data.bf01l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desbf01l1)),
                        DataCell(Text(data.desbf01l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("38")),
                        DataCell(Text("FN-01")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(data.fn01l1 ? iconTrue() : iconFalse()),
                        DataCell(data.fn01l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desfn01l1)),
                        DataCell(Text(data.desfn01l2)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("39")),
                        DataCell(Text("RF-01")),
                        DataCell(Text(rf)),
                        DataCell(Text(rfcf)),
                        DataCell(data.rf01l1 ? iconTrue() : iconFalse()),
                        DataCell(data.rf01l2 ? iconTrue() : iconFalse()),
                        DataCell(Text(data.desrf01l1)),
                        DataCell(Text(data.desrf01l2)),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

Widget iconTrue() {
  return Center(
    child: Image(
      height: 25,
      image: AssetImage("assets/images/icon_true.png"),
    ),
  );
}

Widget iconFalse() {
  return Center(
    child: Image(
      height: 25,
      image: AssetImage("assets/images/icon_false.png"),
    ),
  );
}
