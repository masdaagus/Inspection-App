import 'package:flutter/material.dart';

class PickButton extends StatelessWidget {
  final Function onpress;
  final String tittle;
  final double width;
  final double height;
  final double fontsize;

  PickButton({
    this.onpress,
    this.tittle,
    this.width,
    this.height,
    this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: RaisedButton(
          onPressed: onpress,
          color: Color(0xFFB0BEC5),
          splashColor: Colors.white,
          elevation: 0.20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              tittle,
              style: TextStyle(color: Colors.blueGrey[600], fontSize: fontsize),
            ),
          ),
          textColor: Colors.white),
    );
  }
}
