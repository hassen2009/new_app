import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/barpages/pdfpreview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'colorpdf.dart';
class phototopdf extends StatefulWidget {
  const phototopdf({super.key});

  @override
  State<phototopdf> createState() => _phototopdfState();
}

class _phototopdfState extends State<phototopdf> {
  final picker = ImagePicker();
  List<File> _image=[];
  List<ColorFiltered> filter=[];
  File? x;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,),
        
        ),
     actions: [
       IconButton(icon: Padding(
         padding: const EdgeInsets.only(right: 15),
         child: Icon(Icons.picture_as_pdf_rounded,color: Colors.redAccent,),
       ),onPressed: (){
         _createpdf();
       })
     ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          onPressed: _getimage,
          child: Icon(Icons.image, color: Colors.green,),
        ),
      ),
      body: _image != null ?ListView.builder(
        itemCount: _image.length,
          itemBuilder: (context,index)=>Container(
            height: 300,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child:Image.file(_image[index],fit: BoxFit.cover,)

          ) ): Container(),
    );
  }
   _getimage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    x=File(pickedFile!.path);
   ColorFiltered y= ColorFiltered(colorFilter: ColorFilter.matrix(scan),child: Image.file(File(x!.path)),);
    setState(() {
      if (pickedFile != null) {
      _image.add(x!);
      filter.add(y);
      }
      else {
        print("no image");
      }
    });
  }
  _createpdf()async{
    final pdf = pw.Document();
    for(var img in _image){
      final image = pw.MemoryImage(img.readAsBytesSync());
      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(child: pw.Image(image,height: 1200,width: 600,));
          }

      ));
    }
   Get.to(()=> Pdfpreview(doc: pdf,));
  }
  _savepdf()async{
    final pdf = pw.Document();
    try{
      final dir = await getExternalStorageDirectory();
      final file =File("${dir!.path}/Newpdf.pdf");
      await  file.writeAsBytes(await pdf.save());
      showmssag("Success", "Enregistrer");
    } catch (e){
      showmssag("Erreur", e.toString());
    }

  }
  showmssag(String tittle,String msg){
    Flushbar(
      title: tittle,
      message: msg,
      duration: Duration(seconds: 3),
      icon: Icon(Icons.done,color: Colors.green,),
    )..show(context);
  }
}
