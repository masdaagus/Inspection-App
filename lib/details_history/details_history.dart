import 'package:Inspection/Database/database_mill.dart';
import 'package:Inspection/template/data.dart';
import 'package:flutter/material.dart';

class DetailHistory extends StatelessWidget {
  final int idMill;
  DetailHistory({
    Key key,
    this.idMill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: DataTable(
              columns: [DataColumn(label: Text("Code"))],
              rows: [
                DataRow(cells: [DataCell(Text("Masda"))])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
