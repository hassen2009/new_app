import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:new_app/barpages/phototopdf.dart';
import 'package:new_app/barpages/urlpage.dart';
import 'package:new_app/barpages/urlpagel3.dart';
import 'package:new_app/barpages/userlistl3.dart';
import 'package:new_app/barpages/userslist.dart';
import 'package:new_app/empl/theme.dart';

import '../EEa/homes/btneea.dart';

class conference extends StatefulWidget {
  conference({Key? key}) : super(key: key);

  @override
  State<conference> createState() => _conferenceState();
}

class _conferenceState extends State<conference> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checktypel();
  }
  String typel = "L2";
  _checktypel()async{
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance.collection("users").doc(user?.uid).get();
    setState((){
      typel = snap['typel'];
    });
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left:10.0,right: 10.0),
                color: Get.isDarkMode?Colors.grey[900]:Colors.grey[200],
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: [
                      Icon(Icons.picture_as_pdf,color: Colors.red,),
                      SizedBox(width: 8,),
                      Text("Photos vers pdf ",)
                    ],),
                    IconButton(onPressed: (){
                      Get.to(()=>phototopdf());
                    }, icon:Icon(Icons.navigate_next))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 5,right: 10,left: 10),
                color: Get.isDarkMode?Colors.grey[900]:Colors.grey[200],
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: [
                      Icon(Icons.account_circle_rounded),
                      SizedBox(width: 8,),
                      Text("Utilisateurs",)
                    ],),
                    IconButton(onPressed: (){typel=="L2"?Get.to(()=>Userlist()):typel=="L3"?Get.to(()=>Userlistl3()):null;}, icon:Icon(Icons.navigate_next))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 5,right: 10,left: 10),
                color: Get.isDarkMode?Colors.grey[900]:Colors.grey[200],
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: [
                      Icon(Icons.link,color: Colors.deepPurpleAccent,),
                      SizedBox(width: 8,),
                      Text("Liens",)
                    ],),
                    IconButton(onPressed: (){typel=="L2"?Get.to(()=>const uripage()):typel=="L3"?Get.to(()=>const urlPgel3()):null;}, icon:Icon(Icons.navigate_next))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
