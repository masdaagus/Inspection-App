import 'dart:io';

import 'package:Inspection/service/pdf_helper/api/detail_api.dart';
import 'package:Inspection/service/pdf_helper/models/model_pdf_mill.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfPageApiMill {
  static Future<File> generate(Invoice invoice) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
        pageFormat: PdfPageFormat.legal,
        orientation: PageOrientation.landscape,
        build: (context) => [
              buildLogo(invoice),
              SizedBox(height: 0.8 * PdfPageFormat.cm),
              buildTableMill1(invoice),
            ]));

    return PdfDetailApi.saveDocument(
        name: "${invoice.date}#${invoice.shift}_MILL.pdf", pdf: pdf);
  }

  static Widget buildLogo(Invoice invoice) {
    return Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        Text("PT.CEMINDO GEMILANG",
            style: pw.TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Text("Field Inspection Sheet Cement Mill",
            style: pw.TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          Text("Name\t\t:\t\t ${invoice.name}",
              style: pw.TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 0.10 * PdfPageFormat.cm),
          Text("ID\t\t\t\t\t\t\t\t:\t\t ${invoice.id}",
              style: pw.TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 0.05 * PdfPageFormat.cm),
          Text("Date\t\t\t\t:\t\t ${invoice.date}",
              style: pw.TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 0.05 * PdfPageFormat.cm),
          Text("Page\t\t\t:\t\t 1 of 4",
              style: pw.TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 0.05 * PdfPageFormat.cm),
          Text("Shift\t\t\t\t:\t\t\t${invoice.shift}",
              style: pw.TextStyle(fontWeight: FontWeight.bold)),
        ])
      ],
    );
  }

  static Widget buildTableMill1(Invoice invoice) {
    final headers = [
      'No',
      'Code',
      'Equipments',
      'Checkpoints',
      'Line 1',
      'Line 2',
      'Remarks 1',
      'Remarks 2'
    ];

    final data = invoice.items.map((item) {
      return [
        item.no,
        item.code,
        item.equipments,
        item.checkpoints,
        item.line1 ? "O" : "X",
        item.line2 ? "O" : "X",
        item.remarksline1,
        item.remarksline2
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      cellAlignments: {
        0: pw.Alignment.center,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerLeft,
        4: pw.Alignment.center,
        5: pw.Alignment.center,
      },
      cellHeight: .8 * PdfPageFormat.cm,
      headerStyle: pw.TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
    );
  }
}
