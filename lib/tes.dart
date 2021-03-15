// import 'package:Inspection/data/data.dart';
// import 'package:Inspection/views/home_screen/models/dataModel.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class DemoDetailsPage extends StatelessWidget {
//   final DetailsData data;
//   DemoDetailsPage({
//     Key key,
//     @required this.data,
//   }) : super(key: key);

//   String line = ' ?';

//   @override
//   Widget build(BuildContext context) {
//     print("Update Detail page");
//     return Material(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             data.equipments,
//             style: TextStyle(fontSize: 17),
//           ),
//           centerTitle: true,
//           actions: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Center(
//                 child: Text(
//                   data.code,
//                   style: TextStyle(fontSize: 12, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // backgroundColor: Colors.amber,
//         body: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).requestFocus(new FocusNode());
//           },
//           child: ListView(
//             children: [
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Consumer<DataModel>(
//                           builder: (context, model, _) => Text(
//                             "Remarks :  ${model.lineBerapa}",
//                             style: TextStyle(
//                                 fontSize: 26, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             button(
//                                 tittle: '1',
//                                 onpress: () {
//                                   Provider.of<DataModel>(context, listen: false)
//                                       .line1();
//                                   print("press line 1");
//                                 },
//                                 width: 60,
//                                 height: 30),
//                             SizedBox(width: 6),
//                             button(
//                                 tittle: '2',
//                                 onpress: () {
//                                   Provider.of<DataModel>(context, listen: false)
//                                       .line2();
//                                   print("press line 2");
//                                 },
//                                 width: 60,
//                                 height: 30),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 12),
//                     TextField(
//                       maxLines: 10,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                       ),
//                     ),
//                     SizedBox(height: 18),
//                     Center(
//                         // child: button(tittle: 'Save', onpress: () {}, ),
//                         ),
//                     Center(
//                       child: button(
//                           tittle: 'Save',
//                           onpress: () {
//                             print("press save button");
//                           },
//                           width: MediaQuery.of(context).size.width * .6,
//                           height: 40,
//                           fontsize: 18),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget button(
//       {Function onpress,
//       String tittle,
//       double width,
//       double height,
//       double fontsize}) {
//     return Container(
//       height: height,
//       width: width,
//       child: RaisedButton(
//           onPressed: onpress,
//           color: Color(0xFFB0BEC5),
//           splashColor: Colors.white,
//           elevation: 0.20,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//           child: Center(
//             child: Text(
//               tittle,
//               style: TextStyle(color: Colors.blueGrey[600], fontSize: fontsize),
//             ),
//           ),
//           textColor: Colors.white),
//     );
//   }
// }
