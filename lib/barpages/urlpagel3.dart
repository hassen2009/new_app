import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/barpages/addlinkl3.dart';
import 'package:url_launcher/url_launcher.dart';
class urlPgel3 extends StatefulWidget {
  const urlPgel3({super.key});

  @override
  State<urlPgel3> createState() => _urlPgel3State();
}
CollectionReference ll3 = FirebaseFirestore.instance.collection("linkl3");
class _urlPgel3State extends State<urlPgel3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkrole();
  }
  String role = "user";
  _checkrole()async{
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance.collection("users").doc(user?.uid).get();
    setState((){
      role = snap['role'];
    });
  }
  Future<void> _laucher(String url)async{
  final Uri uri = Uri(scheme: "https",host: url);
    if(!await launchUrl(
  uri,
  mode: LaunchMode.externalApplication
  )){
  throw "error";
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liens"),
       actions: [
         Padding(
           padding: const EdgeInsets.only(right: 18.0),
           child: IconButton(onPressed: (){
             role=="admin l3"?Get.to(()=>linkl3()):null;
           }, icon: Icon(Icons.add_link_outlined,color: Colors.deepPurpleAccent,)),
         )
       ],
        leading:  IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,)),
      ),
      body: StreamBuilder(
          stream: ll3.snapshots(),
    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
    if(snapshot.connectionState==ConnectionState.waiting){
    return Center(child: CircularProgressIndicator());
    }
    if(!snapshot.hasData){
    return Center(child: Text("Aucun rattrapage"));
    }
    List<dynamic> link =[];
    snapshot.data!.docs.forEach((element) {
    link.add(element);
    });

    return ListView.builder(
    padding:EdgeInsets.all(10) ,
    itemCount: link.length,
    itemBuilder: (context,index){
    final lk = link[index];
    final lien = lk['link'];
    final desc =lk['desc'];
    return Card(
    color: Get.isDarkMode?Colors.grey[900]:Colors.white,
    child: ListTile(
    title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text("$desc  ",style: GoogleFonts.lato(
    textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode?Colors.yellow[500]:Colors.deepPurple
    )
    ),),
    ],
    ),

    leading: Icon(Icons.link,color: Colors.deepPurple),
    trailing: IconButton(onPressed: (){ _laucher("$lien");},
    icon: Icon(Icons.send,color: Colors.deepPurpleAccent,)),
    ),
    );
    },
    );
  }
    ));
  }
}
