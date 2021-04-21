// import 'package:Inspection/data/data2.dart';
// import 'package:flutter/material.dart';

// class TesScreen extends StatelessWidget {
//   dynamic ikan;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Material(
//           child: Container(
//         padding: EdgeInsets.symmetric(vertical: 35, horizontal: 5),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               FutureBuilder(
//                   future: fetchData2(context),
//                   builder: (BuildContext context, AsyncSnapshot snapshot) {
//                     ikan = snapshot.data;
//                     if (snapshot.data == null) {
//                       return Center(child: Text("Gak adaa"));
//                     } else {
//                       return Column(
//                         children: [
//                           ListView.builder(
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: snapshot.data.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 Data data = snapshot.data[index];
//                                 IsiData masda = data.data[0];
//                                 // ikan = data.data;
//                                 return Column(
//                                   children: <Widget>[
//                                     ListTile(
//                                       contentPadding:
//                                           EdgeInsets.symmetric(horizontal: 7),
//                                       title: Text(masda.equipments),
//                                       subtitle: Text(masda.checkpoints),
//                                       leading: Text(
//                                         "\t4#6\n${masda.code}",
//                                         style: TextStyle(
//                                             color: Colors.black45,
//                                             fontSize: 11),
//                                       ),
//                                       onTap: () {
//                                         print(data.id);
//                                         print(data.data[0].code);
//                                         print(data.data[0].equipments);
//                                         // print(data.data[0].checkpoints);
//                                         print("=" * 25);
//                                       },
//                                     ),
//                                   ],
//                                 );
//                               }),
//                           RaisedButton(
//                             child: Text("Klik"),
//                             onPressed: () {
//                               print(ikan);
//                             },
//                           )
//                         ],
//                       );
//                     }
//                   })
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
