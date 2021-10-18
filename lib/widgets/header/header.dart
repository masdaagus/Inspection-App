import 'package:Inspection/config/palette.dart';
import 'package:Inspection/controller/controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Header extends StatefulWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    print("header");
    final ctrl = Get.put(Controller());

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xfffff4f1).withOpacity(.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 12,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.white54.withOpacity(.70),
            blurRadius: 12,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.person, size: 40, color: Colors.grey[800]),
                  SizedBox(width: 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${ctrl.userName}",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[800]),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "${ctrl.idUser}",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Shift ${ctrl.shift}",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[800],
                      )),
                  Text("${f.format(ctrl.now)}",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[800],
                      )),
                ],
              ),
              SizedBox(width: 3),
              GetBuilder<Controller>(
                builder: (c) {
                  return IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            initialDate: c.now,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2022),
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.dark(),
                                child: child,
                              );
                            }).then((value) {
                          if (value != null) {
                            c.now = value;
                            print(value);
                            setState(() {});
                          }
                        });
                      });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
