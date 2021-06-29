// import 'package:flutter/material.dart';

// class Shift {
//   String shift;
//   Shift(this.shift);
//   static List<Shift> getShift() {
//     return <Shift>[
//       Shift('Shift 1'),
//       Shift('Shift 2'),
//       Shift('Shift 3'),
//     ];
//   }
// }

// class SelectedShift extends StatefulWidget {
//   const SelectedShift({Key key}) : super(key: key);

//   @override
//   SelectedShiftState createState() => SelectedShiftState();
// }

// class SelectedShiftState extends State<SelectedShift> {
//   List<DropdownMenuItem<Shift>> _dropShiftMenuItem;
//   List<Shift> _shift = Shift.getShift();
//   Shift _selectedShift;

//   DateTime now = DateTime.now();
//   // String shift;

//   List<DropdownMenuItem<Shift>> buildDropShift(List shifts) {
//     List<DropdownMenuItem<Shift>> items = [];
//     for (Shift shift in shifts) {
//       items.add(DropdownMenuItem(
//         value: shift,
//         child: Text(shift.shift),
//       ));
//     }
//     return items;
//   }

//   onChangedDropShift(Shift selectedShift) {
//     setState(() {
//       _selectedShift = selectedShift;
//     });
//   }

//   String bismillah() {
//     DateTime bshift1 = DateTime(now.year, now.month, now.day, 8);
//     DateTime ashift1 = DateTime(now.year, now.month, now.day, 00);
//     DateTime bshift2 = DateTime(now.year, now.month, now.day, 16);
//     DateTime ashift2 = DateTime(now.year, now.month, now.day, 8);
//     DateTime bshift3 = DateTime(now.year, now.month, now.day, 00);
//     DateTime ashift3 = DateTime(now.year, now.month, now.day, 16);

//     if (now.isBefore(bshift1) && now.isAfter(ashift1)) {
//       _selectedShift.shift = 'Shift 1';
//     } else if (now.isBefore(bshift2) && now.isAfter(ashift2)) {
//       _selectedShift.shift = 'Shift 2';
//     } else if (now.isBefore(bshift3) && now.isAfter(ashift3)) {
//       _selectedShift.shift = 'Shift 3';
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _dropShiftMenuItem = buildDropShift(_shift);
//     _selectedShift = _dropShiftMenuItem[0].value;
//     bismillah();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//       items: _dropShiftMenuItem,
//       onChanged: onChangedDropShift,
//       value: _selectedShift,
//     );
//   }
// }
