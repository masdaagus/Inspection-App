// import 'package:Inspection/views/list_screen/home.dart';
// import 'package:flutter/material.dart';

// class SaveWidget extends StatelessWidget {
//   HomeListScreen initHomeListScreen = HomeListScreen();
//   @override
//   Widget build(BuildContext context) {
//     print("Update");
//     judulBismillah.bismillah.forEach((data) {
//       print(data.id);
//     });
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hasil Data"),
//       ),
//       body: Container(
//           child: ListView.builder(
//               itemCount: judulBismillah.bismillah.length,
//               itemBuilder: (BuildContext context, int index) {
//                 if (judulBismillah.bismillah.isEmpty) {
//                   print("ga ada");
//                 } else {
//                   print(judulBismillah.bismillah[index].id);
//                 }

//                 return Column(
//                   children: <Widget>[
//                     ListTile(
//                       contentPadding: EdgeInsets.symmetric(horizontal: 7),
//                       title: Text(judulBismillah.bismillah[index].data[0].code
//                           .toString()),
//                       subtitle: Text(judulBismillah
//                           .bismillah[index].data[0].statusLine1
//                           .toString()),
//                     )
//                   ],
//                 );
//               })),
//     );
//   }
// }
