import 'package:Inspection/Database/database_mill.dart';
import 'package:Inspection/model_database/check_model.dart';
import 'package:flutter/material.dart';

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
    // setState(() => isLoading = true);
    this.data = await DatabaseMill.instance.readMill(widget.idMill);
    // setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SafeArea(
                  child: DataTable(
                    columns: [DataColumn(label: Text("Code"))],
                    rows: [
                      DataRow(cells: [DataCell(Text("MAs"))])
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
