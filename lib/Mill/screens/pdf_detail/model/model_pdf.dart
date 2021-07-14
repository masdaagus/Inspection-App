import 'package:flutter/foundation.dart';

class Invoice {
  final String name;
  final String id;
  final String shift;
  final String date;
  final List<InvoiceItem> items;

  const Invoice({
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
  final String remarksline1;
  final String remarksline2;
  const InvoiceItem({
    @required this.no,
    @required this.code,
    @required this.equipments,
    @required this.checkpoints,
    @required this.line1,
    @required this.line2,
    @required this.remarksline1,
    @required this.remarksline2,
  });
}
