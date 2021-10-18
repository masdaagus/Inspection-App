import 'package:flutter/material.dart';

class ButtonStopwatch extends StatelessWidget {
  const ButtonStopwatch({
    this.icon,
    this.onTap,
    Key key,
  }) : super(key: key);

  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Color(0xfffff4f1).withOpacity(.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 12,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.orange[50].withOpacity(.10),
            blurRadius: 15,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onTap,
        child: Icon(
          icon,
          color: Colors.grey[850],
          size: 30,
        ),
        style: ButtonStyle(),
      ),
    );
  }
}
