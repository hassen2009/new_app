import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

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
    setState(() {

    });
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
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()async{
          await Share.share(widget.PdfUrl,subject: "titre");
          }, icon: Icon(Icons.ios_share))
        ],
        elevation: 0,
        backgroundColor: Get.isDarkMode?Colors.black.withAlpha(1000):Colors.white.withAlpha(2000),
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: document!=null?PDFViewer(
       pickerButtonColor: Colors.deepPurpleAccent,
        scrollDirection: Axis.vertical,
          backgroundColor: Get.isDarkMode?Colors.grey[900]:Colors.grey[300],
          document: document!
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}

