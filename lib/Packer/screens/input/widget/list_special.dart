import 'package:flutter/material.dart';

class ListTileSpecial extends StatelessWidget {
  const ListTileSpecial({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              Color(0xff8e9aaf).withOpacity(.2),
              Color(0xffced4da),
            ], begin: Alignment.topRight, end: Alignment.bottomRight),
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            title: Text(
              "Manual Sliding Gate Silo",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: Colors.grey[800],
              ),
            ),
            subtitle: Text(
              "Motor (cassing dan bearing), Filter udara, Air slide (cassing, chamber udara)",
              style: TextStyle(color: Colors.grey[800], fontSize: 12),
            ),
            leading: Text(
              "code",
              style: TextStyle(color: Colors.black45, fontSize: 11),
            ),
            trailing: Container(
              width: 150,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // CheckBox Line 1
                  Transform.scale(
                    scale: .9,
                    child: Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),

                  Transform.scale(
                    scale: .9,
                    child: Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  Transform.scale(
                    scale: .9,
                    child: Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            dense: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Divider(height: .5, color: Color(0xff001f30)),
        ),
      ],
    );
  }
}
