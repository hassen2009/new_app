import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:new_app/homepage/Storymode/showstr.dart';
import 'package:new_app/homepage/palette.dart';
import 'package:new_app/homepage/Storymode/str3.dart';
import 'package:provider/provider.dart';

import 'authentification.dart';
class stry extends StatefulWidget {
  const stry({super.key});

  @override
  State<stry> createState() => _stryState();
}

class _stryState extends State<stry> with TickerProviderStateMixin{

  final CollectionReference listl33 = FirebaseFirestore.instance.collection("story2");
  final CollectionReference listbb  = FirebaseFirestore.instance.collection("story");
  final CollectionReference lb = FirebaseFirestore.instance.collection("users");
   List pic =[
     "r",
    "O"
  ];

  List<dynamic> pll1 =<dynamic>[
  ];
  List<dynamic> pl2 = [

  ];

  List<String> lname =[
   "17:20",
    "18:30",
    "19:00"
  ];

  var listl3 = [
  ];
  var listb = [
  ];
  var picd = [];
  var named =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkRole();
    putinlist();
  }
  String role ="user";
  _checkRole()async{
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance.collection("users").doc(user?.uid).get();
    setState((){
      role = snap['role'];
    });
  }
  putinlist()async{
    if(listl33!=null){
      await listl33.get().then((value){
        value.docs.forEach((element) {
          setState(() {
            if(listl3.contains(element.get("story2"))){
            }else {
              listl3.add(element.get("story2"));
            }
          });
        });
      });
    }
    if(listbb!=null){
      await listbb.get().then((value){
      value.docs.forEach((element) {
        setState(() {
          if(listb.contains(element.get("story"))){
          }else {
            listb.add(element.get("story"));

          }
        });
      });
    });}
    if(listb.isNotEmpty){
      await lb.where("role",isEqualTo: "admin").get().then((value){
        value.docs.forEach((element) {
          setState(() {
            if(picd.contains(element.get("profilePic"))){
            }else {
              picd.add(element.get("profilePic"));
              named.add(element.get("name"));
            }
          });
        });
      });

    }
    if(listl3.isNotEmpty){
     await lb.where("role",isEqualTo: "admin l3").get().then((value){
        value.docs.forEach((element) {
          setState(() {

            if(picd.contains(element.get("profilePic"))){
            }else {
              picd.add(element.get("profilePic"));
              named.add(element.get("name"));
            }
          });
        });
      });
    }
    else if(listb.isEmpty&&listl3.isEmpty){
      picd=[];
    }

  }
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<Authprovider>(context,listen:false);
    List plist = [listb,listl3];
    if(listb.isEmpty&&listl3.isNotEmpty){
      plist=[listl3];
    }
    if(listb.isNotEmpty&&listl3.isEmpty){
      plist=[listb];
    }
    return Container(
      //color: Colors.grey[900],
      margin: EdgeInsets.only(left: 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(margin: EdgeInsets.only(right: 0),
              padding: EdgeInsets.all(10),
              child: SizedBox(
                height: 185,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:1+picd.length,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              if(index==0){
                                return Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child:CachedNetworkImage(
                                      imageUrl: ap.userModel.profilePic,
                                      height: double.infinity,
                                      width: 110,
                                      fit:BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    height: double.infinity,width: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.0),
                                        gradient: Palette.storyGradient
                                    ),
                                  ),
                                  Positioned(bottom: 48,left: 30,right: 10,child:InkWell(
                                    onTap: (){
                                      Get.to(()=>
                                          null);
                                    },
                                    child: Padding(padding: EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(0),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300]!.withAlpha(2000),
                                                  borderRadius: BorderRadius.circular(50)),
                                              child: IconButton(
                                                  onPressed: (){
                                                    role=="admin"||role=="admin l3"?Get.to(()=>stat()):null;
                                                  },
                                                  icon: Icon(
                                                      Icons.add,
                                                      size: 20,color: Colors.black)))
                                        ],
                                      ),
                                    ),
                                  ) ,),
                                  Positioned(bottom: 8,right: 8,left: 8,child: Text("Ajouter un statut",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),)
                                ],);
                              }
                              else if(picd.isNotEmpty){
                                return Padding(
                                  padding: const EdgeInsets.only(left: 9,),
                                  child: Stack(children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child:CachedNetworkImage(
                                        imageUrl: picd[index-1],
                                        height: double.infinity,
                                        width: 110,
                                        fit:BoxFit.cover,
                                      ),

                                    ),
                                    Container(
                                      height: double.infinity,width: 110,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.0),
                                          gradient: Palette.storyGradient
                                      ),
                                      child: GestureDetector(onTap: (){
                                        Get.to(()=>
                                            showstory(listb: plist[index-1], index: index-1, photos: picd[index-1],name:named[index-1], lnames: lname,
                                            ));
                                      },),
                                    ),
                                    Positioned(top: 8,left: 8,child:InkWell(
                                      onTap: (){
                                        Get.to(()=>
                                            showstory(listb: plist[index-1], index: index-1, photos: picd[index-1],name:named[index-1], lnames: lname,
                                            ));
                                      },
                                      child: Padding(padding: EdgeInsets.all(0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(alignment: Alignment.center,
                                              child: DashedCircle(
                                                gapSize: 0,
                                                dashes: 1,
                                                color: Colors.redAccent,
                                                child: Padding(padding: EdgeInsets.all(2),
                                                  child: CircleAvatar(
                                                    radius: 12,
                                                    backgroundImage: NetworkImage(picd[index-1]),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ) ,),
                                    Positioned(bottom: 8,right: 8,left: 8,child: Text(named[index-1],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,),)
                                  ],),
                                );

                              }

                            },
                          ),
                        ),
                      ),
                    ],)
                  ],
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
