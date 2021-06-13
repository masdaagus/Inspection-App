import 'package:Inspection/Database/database_mill.dart';
import 'package:Inspection/model_database/check_model.dart';
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
  Check data;

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
    final format = new DateFormat('dd-MM-yyyy HH:mm');
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
        'Motor gearbox (temp & vibration), Baut & Mur \n(tube mill main hole, coupling), Mill head trinion (inlet & outlet)';

    final String lq = 'Oil Circulation GearBox';
    final String lqcf = 'Laju Sirkulasi Oli, level dan temp oli';
    final String sr = 'Clasifier';
    final String srcf = 'Motor, coupling dan V-Belt classifer, level grease';
    final String rf = 'Rotary Valve';
    final String rfcf = 'Motor dan putaran RV, leakage (kebocoran)';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          format.format(data.createTime),
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
                    columns: [
                      DataColumn(label: Text("No")),
                      DataColumn(label: Text("Code")),
                      DataColumn(label: Text("Equipments")),
                      DataColumn(label: Text("CHECKPOINTS")),
                      DataColumn(label: Text("Line 1")),
                      DataColumn(label: Text("Line 2")),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text("1")),
                        DataCell(Text("BF-07")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(data.bf07 ? iconTrue() : iconFalse()),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("2")),
                        DataCell(Text("FN-07")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("3")),
                        DataCell(Text("BF-08")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("4")),
                        DataCell(Text("FN-08")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("5")),
                        DataCell(Text("BF-09")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("6")),
                        DataCell(Text("FN-09")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("7")),
                        DataCell(Text("BF-10")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("8")),
                        DataCell(Text("FN-10")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("9")),
                        DataCell(Text("NG-01")),
                        DataCell(Text(neddle)),
                        DataCell(Text(neddlecf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("10")),
                        DataCell(Text("NG-02")),
                        DataCell(Text(neddle)),
                        DataCell(Text(neddlecf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("11")),
                        DataCell(Text("NG-03")),
                        DataCell(Text(neddle)),
                        DataCell(Text(neddlecf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("12")),
                        DataCell(Text("NG-04")),
                        DataCell(Text(neddle)),
                        DataCell(Text(neddlecf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("13")),
                        DataCell(Text("WF-01")),
                        DataCell(Text(wf + " Limestone")),
                        DataCell(Text(wfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("14")),
                        DataCell(Text("WF-02")),
                        DataCell(Text(wf + " Clinker")),
                        DataCell(Text(wfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("15")),
                        DataCell(Text("WF-03")),
                        DataCell(Text(wf + " Trass")),
                        DataCell(Text(wfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("16")),
                        DataCell(Text("WF-04")),
                        DataCell(Text(wf + " Gypsum")),
                        DataCell(Text(wfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("17")),
                        DataCell(Text("BC-01")),
                        DataCell(Text(bc)),
                        DataCell(Text(bccf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("18")),
                        DataCell(Text("BC-02")),
                        DataCell(Text(bc)),
                        DataCell(Text(bccf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("19")),
                        DataCell(Text("BF-02")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("20")),
                        DataCell(Text("FN-02")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("21")),
                        DataCell(Text("BF-03")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("22")),
                        DataCell(Text("FN-03")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("23")),
                        DataCell(Text("BF-04")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("24")),
                        DataCell(Text("FN-04")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("25")),
                        DataCell(Text("BF-05")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("26")),
                        DataCell(Text("FN-05")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("27")),
                        DataCell(Text("BF-06")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("28")),
                        DataCell(Text("FN-06")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("29")),
                        DataCell(Text("SC-01")),
                        DataCell(Text(sc)),
                        DataCell(Text(sccf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("30")),
                        DataCell(Text("SC-02")),
                        DataCell(Text(sc)),
                        DataCell(Text(sccf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("31")),
                        DataCell(Text("SC-03")),
                        DataCell(Text(sc)),
                        DataCell(Text(sccf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("32")),
                        DataCell(Text("BE-01")),
                        DataCell(Text(be)),
                        DataCell(Text(becf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("33")),
                        DataCell(Text("BM-01")),
                        DataCell(Text(bm)),
                        DataCell(Text(bmcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("34")),
                        DataCell(Text("LQ-01")),
                        DataCell(Text(lq)),
                        DataCell(Text(lqcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("35")),
                        DataCell(Text("LQ-02")),
                        DataCell(Text(lq)),
                        DataCell(Text(lqcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("36")),
                        DataCell(Text("SR-01")),
                        DataCell(Text(sr)),
                        DataCell(Text(srcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("37")),
                        DataCell(Text("BF-01")),
                        DataCell(Text(bagfilter)),
                        DataCell(Text(bfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("38")),
                        DataCell(Text("FN-01")),
                        DataCell(Text("Fan " + bagfilter)),
                        DataCell(Text(fncf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("39")),
                        DataCell(Text("RF-01")),
                        DataCell(Text(rf)),
                        DataCell(Text(rfcf)),
                        DataCell(Text("")),
                        DataCell(Text("")),
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
