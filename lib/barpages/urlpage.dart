import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'addlinkl2.dart';

class uripage extends StatefulWidget {
  const uripage({super.key});

  @override
  State<uripage> createState() => _uripageState();
}
CollectionReference ll2 = FirebaseFirestore.instance.collection("linkl2");
class _uripageState extends State<uripage> {
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
                role=="admin"?Get.to(()=>linkl2()):null;
              }, icon: Icon(Icons.add_link_outlined,color: Colors.deepPurpleAccent,)),
            )
          ],
          leading:  IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios,)),
        ),
        body: StreamBuilder(
            stream: ll2.snapshots(),
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              if(!snapshot.hasData){
                return Center(child: Text("Aucun rattrapage"));
              }
              List<dynamic> link2 =[];
              snapshot.data!.docs.forEach((element) {
                link2.add(element);
              });

              return ListView.builder(
                padding:EdgeInsets.all(10) ,
                itemCount: link2.length,
                itemBuilder: (context,index){
                  final lk2 = link2[index];
                  final lien2 = lk2['link'];
                  final desc =lk2['desc'];
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
                      trailing: IconButton(onPressed: (){ _laucher("$lien2");},
                          icon: Icon(Icons.send,color: Colors.deepPurpleAccent,)),
                    ),
                  );
                },
              );
            }
        ));
  }
}
