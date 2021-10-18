import 'package:Inspection/config/palette.dart';
import 'package:Inspection/controller/controller.dart';
import 'package:Inspection/pages/croscheck/controller/cloud.dart';
import 'package:Inspection/pages/croscheck/history/widgets/checker_view.dart';
import 'package:Inspection/pages/croscheck/history/widgets/list_tile.dart';
import 'package:Inspection/pages/croscheck/model/model-cc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckerStory extends StatelessWidget {
  const CheckerStory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CrossCheckController controller = CrossCheckController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder<QuerySnapshot<Object>>(
            future: controller.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> data = snapshot.data.docs[index].data()
                        as Map<String, dynamic>;
                    DateTime date = DateFormat('yyyy-MM-dd hh:mm:ss')
                        .parse(data[CrossCheckInput.time]);
                    final ctrl = Get.put(Controller());

                    if (data[CrossCheckInput.userName] == ctrl.userName) {
                      return Column(
                        children: [
                          ListTileItem(
                            date: '${f.format(date)}#${data['SHIFT']}',
                            material: data[CrossCheckInput.material],
                            error: data[CrossCheckInput.error],
                            delete: () => controller
                                .deleteData(snapshot.data.docs[index].id),
                            line: data[CrossCheckInput.line],
                            open: () => Get.to(CheckerView(
                              data: data,
                              date: date,
                            )),
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
