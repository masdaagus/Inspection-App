import 'dart:io';

import 'package:Inspection/views/screens/pdf_detail/model/model_pdf.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import 'detail_api.dart';

class PdfPageApi {
  static Future<File> generate(Invoice invoice1, Invoice invoice2) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
        pageFormat: PdfPageFormat.legal,
        orientation: PageOrientation.landscape,
        build: (context) => [
              buildLogo(),
              SizedBox(height: 0.8 * PdfPageFormat.cm),
              buildTableMill1(invoice1),
            ]));

    pdf.addPage(MultiPage(
        pageFormat: PdfPageFormat.legal,
        orientation: PageOrientation.landscape,
        build: (context) => [
              buildTableMill1(invoice1),
            ]));

    return PdfDetailApi.saveDocument(name: "${invoice1.date}.pdf", pdf: pdf);
  }

  static Widget buildTittel() =>
      Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        Text(
          'INVOICE',
          style: pw.TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 0.8 * PdfPageFormat.cm),
        Text("Masda agus"),
        SizedBox(height: 0.8 * PdfPageFormat.cm),
      ]);

  static Widget buildLogo() {
    return Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        Text("PT.CEMINDO GEMILANG",
            style: pw.TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Text("Field Inspection Sheet Cement Mill",
            style: pw.TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          Text("Name\t\t:\t\t Wahyu Tromol",
              style: pw.TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 0.10 * PdfPageFormat.cm),
          Text("ID\t\t\t\t\t\t\t\t:\t\t 26458364",
              style: pw.TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 0.05 * PdfPageFormat.cm),
          Text("Date\t\t\t\t:\t\t 22 Januari 2020",
              style: pw.TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 0.05 * PdfPageFormat.cm),
          Text("Page\t\t\t:\t\t 1 of 3",
              style: pw.TextStyle(fontWeight: FontWeight.bold)),
        ])
      ],
    );
  }

  static Widget buildTableMill1(Invoice invoice1) {
    final headers = [
      'Code',
      'Equipments',
      'Checkpoints',
      'Line 1',
      'Line 2',
      'Remarks 1',
      'Remarks 2'
    ];

    final data = invoice1.items.map((item) {
      return [
        item.code,
        item.equipments,
        item.checkpoints,
        item.line1,
        item.line2,
        item.remarksline1,
        item.remarksline2
      ];
    }).toList();

    return Table.fromTextArray(headers: headers, data: data);
  }
}
