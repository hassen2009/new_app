import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:new_app/homepage/ctg/Semestres/semestre4/pdfviewer.dart';

import '../../../home_page.dart';
import 'Courspage.dart';
class addone extends StatefulWidget {
  const addone({Key? key}) : super(key: key);

  @override
  State<addone> createState() => _addoneState();
}

class _addoneState extends State<addone> {
  final FirebaseFirestore  _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData =[];

 Future<String> uploadPdf(String fileName,File file) async {
 final reference = FirebaseStorage.instance.ref().child("pdfs/$fileName.pdf");
 final uploadTask = reference.putFile(file);
 await uploadTask.whenComplete((){});
 final downloadLink = await reference.getDownloadURL();
 return downloadLink;
 }
 void pickFile() async {
   final pickedFile = await FilePicker.platform.pickFiles(
     type: FileType.custom,
     allowedExtensions: ['pdf'],
   );
   if(pickedFile != null){
     String fileName = pickedFile.files[0].name;
    File file = File(pickedFile.files[0].path!);
     final downloadLink = await uploadPdf(fileName, file);
    await   _firebaseFirestore.collection("pdfs").add({
       "name" : fileName,
       "url": downloadLink
     });
    print("pdf uploaded successfully");
   }
   else{return;}
 }
 void getAllPdf()async{
   final result = await  _firebaseFirestore.collection("pdfs").get();
   pdfData = result.docs.map((e) =>  e.data()).toList();
   setState(() {

   });
 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getAllPdf();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: Get.isDarkMode?Colors.grey[900]:Colors.grey[300],
            borderRadius: BorderRadius.circular(25),
          ),
          child: GestureDetector(
            onTap: (){
              Get.to(()=>HomePge());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 11.0),
              child: Icon(Icons.home_filled,size: 20,color: CupertinoColors.activeBlue,),
            ),
          ),
        ),],
        title: Text("Cours",),
        leading: Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.only(left: 7),
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .primary,
            borderRadius: BorderRadius.circular(25),
          ),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, size: 20,),
          ),
        ),
      ),
    body: GridView.builder(
      itemCount: pdfData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index){
        return Padding(
            padding:EdgeInsets.all(20),
          child: InkWell(
            onTap: (){
              Get.to(()=> pdfviewer(PdfUrl: pdfData[index]["url"],));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Get.isDarkMode?Colors.grey[600]!:Colors.grey[900]!)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Image.asset("assets/images/pdf.png",height: 120,width: 100,),
                  Text(pdfData[index]["name"],style: TextStyle(fontSize: 18),)
                ],
              ),
            ),
          ),
        );
        }
    ),
      floatingActionButton: FloatingActionButton(onPressed: pickFile,
        child: Icon(Icons.upload_file,color: Get.isDarkMode?Colors.white:Colors.red,),
        backgroundColor: Get.isDarkMode?Colors.grey[900]:Colors.white,

      ),
    );
  }

}



