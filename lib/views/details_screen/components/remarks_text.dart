import 'package:flutter/material.dart';

class RemarksTextField extends StatefulWidget {
  @override
  _RemarksTextFieldState createState() => _RemarksTextFieldState();
}

class _RemarksTextFieldState extends State<RemarksTextField> {
  TextEditingController remakrsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: remakrsController,
      maxLines: 10,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
