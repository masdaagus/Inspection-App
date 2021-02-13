import 'package:flutter/material.dart';
import 'components/data_listview.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: DataListView(),
        ),
      ),
    );
  }
}
