import 'package:Inspection/template/data.dart';
import 'package:flutter/material.dart';

class RemarksTextField extends StatefulWidget {
  RemarksTextField({
    this.data,
    Key key,
  }) : super(key: key);

  final DataMill data;

  @override
  _RemarksTextFieldState createState() => _RemarksTextFieldState();
}

class _RemarksTextFieldState extends State<RemarksTextField> {
  TextEditingController remakrsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: remakrsController,
      maxLines: 8,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: widget.data.code),
    );
  }
}
