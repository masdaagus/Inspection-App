import 'dart:ui';

import 'package:Inspection/config/palette.dart';
import 'package:flutter/material.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    Key key,
    this.date,
    this.material,
    this.line,
    this.error,
    this.delete,
    this.open,
  }) : super(key: key);

  final String date;
  final String material;
  final String line;
  final double error;
  final Function delete;
  final Function open;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 6, right: 3, left: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Color(0xffdee2ff).withOpacity(.3),
                Color(0xffced4da),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.20),
                  blurRadius: 1.5,
                  spreadRadius: 1),
            ],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.only(
              left: 28,
              right: 5,
              top: 5,
              bottom: 5,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // "${f.format(date)}#${data[MillFirebaseInput.shift]}",
                  date,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "$material($line)",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            trailing: Container(
              width: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Text('16%'),
                  Container(
                    width: 80,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.black12,
                    ),
                    child: Center(
                      child: Text(
                        "${ft.format(error)}%",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 50,
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: delete,
                    ),
                  ),
                ],
              ),
            ),
            dense: true,
            onTap: open,
          ),
        ),
        // Divider(height: 1, color: Color(0xff001f30)),
      ],
    );
  }
}
