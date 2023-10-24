import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:new_app/homepage/ctg/Semestres/semestre4/pdfviewer.dart';
import 'package:share_plus/share_plus.dart';
import '../../../home_page.dart';
class addtotds4 extends StatefulWidget {
  const addtotds4({Key? key}) : super(key: key);
  @override
  State<addtotds4> createState() => _addtotds4State();
}
class _addtotds4State extends State<addtotds4> {
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
  final CollectionReference pdfs = FirebaseFirestore.instance.collection("pdfstds4");
  Future<void> delete([DocumentSnapshot?documentSnapshot])async{
    await showModalBottomSheet(
        backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
        isScrollControlled: true,
        context: context, builder: (BuildContext ctx){
      return Padding(
        padding:EdgeInsets.only(
            top: 40,left: 20,
            right: 20,bottom: MediaQuery.of(ctx).viewInsets.bottom+20 ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                onPressed: ()async{

                }, child: Text("Supprimer",style: TextStyle(color: Colors.white),))

          ],
        ) ,
      );
    });

  }
  Future<void> delet(String productID)async{
    await pdfs.doc(productID).delete();
  }
  Future<String> uploadPdf(String fileName,File file) async {
    final reference = FirebaseStorage.instance.ref().child("pdfstds4/$fileName.pdf");
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
      await   _firebaseFirestore.collection("pdfstds4").doc(fileName).set({
        "name" : fileName,
        "url": downloadLink
      });
      print("pdf uploaded successfully");
    }
    else{return;}
  }
  void share()async{
    await Share.shareXFiles(pdfData[0]["url"],subject: "k",text: "j") ;
  }
  void getAllPdf()async{
    final result = await  _firebaseFirestore.collection("pdfstds4").get();
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
        title: Text("Tds",),
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
                onLongPress: ()async{
                  await _firebaseFirestore.collection('pdfstds4').doc(pdfData[index]["name"]).delete();
                },
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



