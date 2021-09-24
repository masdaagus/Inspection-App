import 'package:flutter/foundation.dart';

class InvoicePacker {
  final String name;
  final String id;
  final String shift;
  final String date;
  final List<InvoiceItem> items;

  const InvoicePacker({
    @required this.name,
    @required this.id,
    @required this.shift,
    @required this.date,
    @required this.items,
  });
}

class InvoiceItem {
  final int no;
  final String code;
  final String equipments;
  final String checkpoints;
  final bool line1;
  final bool line2;
  final bool line3;
  final String remarksline1;
  final String remarksline2;
  final String remarksline3;
  InvoiceItem({
    @required this.no,
    @required this.code,
    @required this.equipments,
    @required this.checkpoints,
    @required this.line1,
    @required this.line2,
    this.line3,
    @required this.remarksline1,
    @required this.remarksline2,
    this.remarksline3,
  });
}
