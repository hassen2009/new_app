import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
class Pdfpreview extends StatelessWidget {
  final pw.Document doc;
  const Pdfpreview({super.key,required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PdfPreview(build: (format)=>doc.save(),
      allowPrinting: true,
        allowSharing: true,
       initialPageFormat: PdfPageFormat.a4,
        pdfFileName: "Newpdf.pdf",
      )
    );
  }
}
