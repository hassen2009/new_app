import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class pdfviewer extends StatefulWidget {
  final PdfUrl;
  const pdfviewer({Key? key,required this.PdfUrl}) : super(key: key);

  @override
  State<pdfviewer> createState() => _pdfviewerState();
}

class _pdfviewerState extends State<pdfviewer> {
  PDFDocument? document;
  void initialisepdf()async{
    document = await PDFDocument.fromURL(widget.PdfUrl);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialisepdf();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: document!=null?PDFViewer(document: document!):Center(child: CircularProgressIndicator(),),
    );
  }
}

