import 'package:Inspection/controller/controller.dart';
import 'package:Inspection/widgets/input_detail/remarks_mill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ListMill extends StatelessWidget {
  const ListMill({Key key, @required this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionExtentRatio: .20,
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: "Remarks",
          color: Colors.grey,
          icon: Icons.edit,
          onTap: () {
            Get.to(() => RemarksMill(data: data));
          },
        )
      ],
      child: Column(
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
                "${data.equipments}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.grey[800],
                ),
              ),
              subtitle: Text(
                "${data.checkpoints}",
                style: TextStyle(color: Colors.grey[800], fontSize: 12),
              ),
              leading: Text(
                "${data.code}",
                style: TextStyle(color: Colors.black45, fontSize: 11),
              ),
              trailing: Container(
                width: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // CheckBox
                    Transform.scale(
                      scale: .9,
                      child: GetBuilder<Check>(
                        builder: (c) {
                          return Checkbox(
                            value: data.checklist_1,
                            onChanged: (value) {
                              c.tesbox(data.checklist_1 = value);
                            },
                          );
                        },
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
      ),
    );
  }
}
