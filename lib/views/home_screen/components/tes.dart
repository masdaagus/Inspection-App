import 'package:flutter/material.dart';
import '../../../data.dart';

class DetailsPage extends StatelessWidget {
  final DetailsData data;
  DetailsPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text(data.checkpoints)),
      ),
    );
  }
}
