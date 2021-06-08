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
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      // onChanged: (value) {
      //   widget.data.description_1 = value;
      // },
      onSubmitted: (String value) {},
      controller: _controller,
      maxLines: 8,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: widget.data.code),
    );
  }
}
