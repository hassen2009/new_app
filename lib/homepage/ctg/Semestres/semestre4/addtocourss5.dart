import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:new_app/homepage/ctg/Semestres/semestre4/pdfviewer.dart';
import '../../../home_page.dart';
class addtocours5 extends StatefulWidget {
  const addtocours5({Key? key}) : super(key: key);
  @override
  State<addtocours5> createState() => _addtocours5State();
}
class _addtocours5State extends State<addtocours5> {
  String role = "user";
  _checkrole()async{
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance.collection("users").doc(user?.uid).get();
    setState((){
      role = snap['role'];
    });
  }
  final FirebaseFirestore  _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData =[];

  Future<String> uploadPdf(String fileName,File file) async {
    final reference = FirebaseStorage.instance.ref().child("pdfss5/$fileName.pdf");
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
      await   _firebaseFirestore.collection("pdfss5").add({
        "name" : fileName,
        "url": downloadLink
      });
      print("pdf uploaded successfully");
    }
    else{return;}
  }
  void getAllPdf()async{
    final result = await  _firebaseFirestore.collection("pdfss5").get();
    pdfData = result.docs.map((e) =>  e.data()).toList();
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkrole();
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
      floatingActionButton: FloatingActionButton(onPressed: role=="admin l3"?pickFile:role=="admin"?pickFile:null,
        child: Icon(Icons.upload_file,color: Get.isDarkMode?Colors.white:Colors.red,),
        backgroundColor: Get.isDarkMode?Colors.grey[900]:Colors.white,

      ),
    );
  }

}



