// import 'package:Inspection/models/data_model.dart';
// import 'package:Inspection/views/details_screen/home.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../data/data.dart';

// class DataListView extends StatelessWidget {
//   DataListView({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<DataModel>(context, listen: false);

//     print("Update listview page");
//     return Material(
//       color: Colors.grey[300],
//       child: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               FutureBuilder(
//                 future: fetchData(context),
//                 builder: (context, snapshot) {
//                   if (snapshot.data == null) {
//                     return Container(child: Center(child: Text("Loading...")));
//                   } else {
//                     return ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: snapshot.data.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           DetailsData data = snapshot.data[index];

//                           return Column(
//                             children: [
//                               Column(
//                                 children: [
//                                   Slidable(
//                                     secondaryActions: <Widget>[
//                                       iconSlide(data, context),
//                                     ],
//                                     actionExtentRatio: .20,
//                                     actionPane: SlidableDrawerActionPane(),
//                                     child: ListTile(
//                                       contentPadding:
//                                           EdgeInsets.symmetric(horizontal: 7),
//                                       title: Text(
//                                         data.equipments,
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                       subtitle: Text(
//                                         data.checkpoints,
//                                       ),
//                                       tileColor: Colors.grey[300],
//                                       leading: Text(
//                                         "\t4#6\n${data.code}",
//                                         style: TextStyle(
//                                             color: Colors.black45,
//                                             fontSize: 11),
//                                       ),
//                                       trailing: Container(
//                                         width: 96,
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Transform.scale(
//                                                 scale: .8,
//                                                 child: Consumer<DataModel>(
//                                                   builder:
//                                                       (context, model, _) =>
//                                                           Checkbox(
//                                                     value:
//                                                         model.isSelected1(data),
//                                                     onChanged: (value) {
//                                                       provider.check1(data);
//                                                       var mas = model
//                                                           .isSelected1(data);

//                                                       print('Line - 1');
//                                                       print(mas);
//                                                       print(data.code);
//                                                       print('=' * 10);
//                                                     },
//                                                   ),
//                                                 )),
//                                             Transform.scale(
//                                                 scale: .8,
//                                                 child: Consumer<DataModel>(
//                                                   builder:
//                                                       (context, model, _) =>
//                                                           Checkbox(
//                                                     value:
//                                                         model.isSelected2(data),
//                                                     onChanged: (value) {
//                                                       provider.check2(data);
//                                                       var mas = model
//                                                           .isSelected2(data);
//                                                       print(data.code);
//                                                       print('Line - 2');
//                                                       print(mas);
//                                                       print('=' * 10);
//                                                     },
//                                                   ),
//                                                 )),
//                                           ],
//                                         ),
//                                       ),
//                                       dense: true,
//                                     ),
//                                   ),
//                                   Divider(
//                                     height: 1,
//                                     color: Colors.black,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           );
//                         });
//                   }
//                 },
//               ),
//               SizedBox(height: 5),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget iconSlide(DetailsData data, BuildContext context) {
//     return IconSlideAction(
//       caption: 'Remarks',
//       color: Colors.grey,
//       icon: Icons.edit,
//       onTap: () {
//         print("Selectd ${data.code}");
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => DetailsPage(
//                       data: data,
//                     )));
//       },
//     );
//   }

//   Text buildText(String text) {
//     return Text(
//       text,
//       style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//     );
//   }
// }
