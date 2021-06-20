import 'package:Inspection/Database/database_mill.dart';
import 'package:Inspection/model_database/mill_model.dart';
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
  final DateFormat formatDate = DateFormat('dd-MM-yyyy HH:mm');
  Mill mill;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  Future refresh() async {
    setState(() => isLoading = true);
    this.mill = await DatabaseMill.instance.readMill(widget.idMill);
    print(mill);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
