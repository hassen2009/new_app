import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class empr extends StatefulWidget {
  const empr({super.key});

  @override
  State<empr> createState() => _emprState();
}

class _emprState extends State<empr> {
  DateTime timedate= DateTime.now();
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

  final CollectionReference _cour = FirebaseFirestore.instance.collection("lundi");
  final CollectionReference _mardi = FirebaseFirestore.instance.collection("mardi");
  final CollectionReference _mercredi = FirebaseFirestore.instance.collection("mercredi");
  final CollectionReference _jeudi = FirebaseFirestore.instance.collection("jeudi");
  final CollectionReference _vendredi = FirebaseFirestore.instance.collection("vendredi");
  final CollectionReference _samedi = FirebaseFirestore.instance.collection("samedi");
  final TextEditingController cours=TextEditingController();
  final TextEditingController date=TextEditingController();
  final TextEditingController prof=TextEditingController();
  final TextEditingController salle=TextEditingController();
  final TextEditingController type=TextEditingController();
  Future<void> create([DocumentSnapshot?documentSnapshot])async{
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
            Center(child: Text("Ajouter une séance",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            TextField(controller: cours,decoration: InputDecoration(
                labelText: "Cours",hintText: "cours",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: date,decoration: InputDecoration(
                labelText: "Date",hintText: "date",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: prof,decoration: InputDecoration(
                labelText: "Prof",hintText: "prof",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: salle,decoration: InputDecoration(
                labelText: "Salle",hintText: "salle",labelStyle: TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: type,decoration: InputDecoration(
                labelText: "Type",hintText: "type",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                onPressed: ()async{
                  final String cour= cours.text;
                  final String dat = date.text;
                  final String pro = prof.text;
                  final String sall = salle.text;
                  final String typ = type.text;
                  if(cour!=null&&dat!=null&&pro!=null&&sall!=null&&typ!=null){
                    await _cour.add({"cours":cour,"date":dat,"prof":pro,"salle":sall,"type":typ,"time":Timestamp.now()});
                    cours.text="";
                    date.text="";
                    prof.text="";
                    salle.text="";
                    type.text="";
                    Get.back();

                  }


                }, child: Text("Créer",style: TextStyle(color: Colors.white),))

          ],
        ) ,
      );
    });
  }
  Future<void> createm([DocumentSnapshot?documentSnapshot])async{
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
            Center(child: Text("Ajouter une séance",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            TextField(controller: cours,decoration: InputDecoration(
                labelText: "Cours",hintText: "cours",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: date,decoration: InputDecoration(
                labelText: "Date",hintText: "date",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: prof,decoration: InputDecoration(
                labelText: "Prof",hintText: "prof",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: salle,decoration: InputDecoration(
                labelText: "Salle",hintText: "salle",labelStyle: TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: type,decoration: InputDecoration(
                labelText: "Type",hintText: "type",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                onPressed: ()async{
                  final String cour= cours.text;
                  final String dat = date.text;
                  final String pro = prof.text;
                  final String sall = salle.text;
                  final String typ = type.text;
                  if(cour!=null&&dat!=null&&pro!=null&&sall!=null&&typ!=null){
                    await _mardi.add({"cours":cour,"date":dat,"prof":pro,"salle":sall,"type":typ,"time":Timestamp.now()});
                    cours.text="";
                    date.text="";
                    prof.text="";
                    salle.text="";
                    type.text="";
                    Get.back();

                  }


                }, child: Text("Créer",style: TextStyle(color: Colors.white),))

          ],
        ) ,
      );
    });
  }
  Future<void> createmer([DocumentSnapshot?documentSnapshot])async{
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
            Center(child: Text("Ajouter une séance",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            TextField(controller: cours,decoration: InputDecoration(
                labelText: "Cours",hintText: "cours",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: date,decoration: InputDecoration(
                labelText: "Date",hintText: "date",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: prof,decoration: InputDecoration(
                labelText: "Prof",hintText: "prof",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: salle,decoration: InputDecoration(
                labelText: "Salle",hintText: "salle",labelStyle: TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: type,decoration: InputDecoration(
                labelText: "Type",hintText: "type",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                onPressed: ()async{
                  final String cour= cours.text;
                  final String dat = date.text;
                  final String pro = prof.text;
                  final String sall = salle.text;
                  final String typ = type.text;
                  if(cour!=null&&dat!=null&&pro!=null&&sall!=null&&typ!=null){
                    await _mercredi.add({"cours":cour,"date":dat,"prof":pro,"salle":sall,"type":typ,"time":Timestamp.now()});
                    cours.text="";
                    date.text="";
                    prof.text="";
                    salle.text="";
                    type.text="";
                    Get.back();

                  }


                }, child: Text("Créer",style: TextStyle(color: Colors.white),))

          ],
        ) ,
      );
    });
  }
  Future<void> createjeu([DocumentSnapshot?documentSnapshot])async{
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
            Center(child: Text("Ajouter une séance",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            TextField(controller: cours,decoration: InputDecoration(
                labelText: "Cours",hintText: "cours",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: date,decoration: InputDecoration(
                labelText: "Date",hintText: "date",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: prof,decoration: InputDecoration(
                labelText: "Prof",hintText: "prof",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: salle,decoration: InputDecoration(
                labelText: "Salle",hintText: "salle",labelStyle: TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: type,decoration: InputDecoration(
                labelText: "Type",hintText: "type",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                onPressed: ()async{
                  final String cour= cours.text;
                  final String dat = date.text;
                  final String pro = prof.text;
                  final String sall = salle.text;
                  final String typ = type.text;
                  if(cour!=null&&dat!=null&&pro!=null&&sall!=null&&typ!=null){
                    await _jeudi.add({"cours":cour,"date":dat,"prof":pro,"salle":sall,"type":typ,"time":Timestamp.now()});
                    cours.text="";
                    date.text="";
                    prof.text="";
                    salle.text="";
                    type.text="";
                    Get.back();

                  }


                }, child: Text("Créer",style: TextStyle(color: Colors.white),))

          ],
        ) ,
      );
    });
  }
  Future<void> createven([DocumentSnapshot?documentSnapshot])async{
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
            Center(child: Text("Ajouter une séance",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            TextField(controller: cours,decoration: InputDecoration(
                labelText: "Cours",hintText: "cours",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: date,decoration: InputDecoration(
                labelText: "Date",hintText: "date",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: prof,decoration: InputDecoration(
                labelText: "Prof",hintText: "prof",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: salle,decoration: InputDecoration(
                labelText: "Salle",hintText: "salle",labelStyle: TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: type,decoration: InputDecoration(
                labelText: "Type",hintText: "type",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                onPressed: ()async{
                  final String cour= cours.text;
                  final String dat = date.text;
                  final String pro = prof.text;
                  final String sall = salle.text;
                  final String typ = type.text;
                  if(cour!=null&&dat!=null&&pro!=null&&sall!=null&&typ!=null){
                    await _vendredi.add({"cours":cour,"date":dat,"prof":pro,"salle":sall,"type":typ,"time":Timestamp.now()});
                    cours.text="";
                    date.text="";
                    prof.text="";
                    salle.text="";
                    type.text="";
                    Get.back();

                  }


                }, child: Text("Créer",style: TextStyle(color: Colors.white),))

          ],
        ) ,
      );
    });
  }
  Future<void> createsam([DocumentSnapshot?documentSnapshot])async{
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
            Center(child: Text("Ajouter une séance",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            TextField(controller: cours,decoration: InputDecoration(
                labelText: "Cours",hintText: "cours",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: date,decoration: InputDecoration(
                labelText: "Date",hintText: "date",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: prof,decoration: InputDecoration(
                labelText: "Prof",hintText: "prof",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: salle,decoration: InputDecoration(
                labelText: "Salle",hintText: "salle",labelStyle: TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: type,decoration: InputDecoration(
                labelText: "Type",hintText: "type",labelStyle: TextStyle(color:  Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                onPressed: ()async{
                  final String cour= cours.text;
                  final String dat = date.text;
                  final String pro = prof.text;
                  final String sall = salle.text;
                  final String typ = type.text;
                  if(cour!=null&&dat!=null&&pro!=null&&sall!=null&&typ!=null){
                    await _samedi.add({"cours":cour,"date":dat,"prof":pro,"salle":sall,"type":typ,"time":Timestamp.now()});
                    cours.text="";
                    date.text="";
                    prof.text="";
                    salle.text="";
                    type.text="";
                    Get.back();

                  }


                }, child: Text("Créer",style: TextStyle(color: Colors.white),))

          ],
        ) ,
      );
    });
  }
  Future<void> update([DocumentSnapshot?documentSnapshot])async{
    if(documentSnapshot!=null){
      cours.text = documentSnapshot['cours'];
      date.text = documentSnapshot['date'];
      prof.text = documentSnapshot['prof'];
      salle.text = documentSnapshot['salle'];
      type.text = documentSnapshot['type'];
    }
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
            Center(child: Text("Modifier",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            TextField(controller: cours,decoration: InputDecoration(
                labelText: "Cours",hintText: "cours",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: date,decoration: InputDecoration(
                labelText: "Date",hintText: "date",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: prof,decoration: InputDecoration(
                labelText: "Prof",hintText: "prof",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: salle,decoration: InputDecoration(
                labelText: "Salle",hintText: "salle",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: type,decoration: InputDecoration(
                labelText: "Type",hintText: "type",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                onPressed: ()async{
                  final String cour= cours.text;
                  final String dat = date.text;
                  final String pro = prof.text;
                  final String sall = salle.text;
                  final String typ = type.text;

                  if(cour!=null){
                    await _cour.doc(documentSnapshot?.id).update({"cours":cour,"date":dat,"prof":pro,"salle":sall,"type":typ,});
                    cours.text="";
                    date.text="";
                    prof.text="";
                    salle.text="";
                    type.text="";
                    Get.back();
                  }

                }, child: Text("Modifier",style: TextStyle(color: Colors.white),))

          ],
        ),
      );
    });
  }
  Future<void> updatem([DocumentSnapshot?documentSnapshot])async{
    if(documentSnapshot!=null){
      cours.text = documentSnapshot['cours'];
      date.text = documentSnapshot['date'];
      prof.text = documentSnapshot['prof'];
      salle.text = documentSnapshot['salle'];
      type.text = documentSnapshot['type'];
    }
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
            Center(child: Text("Modifier",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            TextField(controller: cours,decoration: InputDecoration(
                labelText: "Cours",hintText: "cours",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: date,decoration: InputDecoration(
                labelText: "Date",hintText: "date",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: prof,decoration: InputDecoration(
                labelText: "Prof",hintText: "prof",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: salle,decoration: InputDecoration(
                labelText: "Salle",hintText: "salle",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: type,decoration: InputDecoration(
                labelText: "Type",hintText: "type",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                onPressed: ()async{
                  final String cour= cours.text;
                  final String dat = date.text;
                  final String pro = prof.text;
                  final String sall = salle.text;
                  final String typ = type.text;

                  if(cour!=null){
                    await _mardi.doc(documentSnapshot?.id).update({"cours":cour,"date":dat,"prof":pro,"salle":sall,"type":typ});
                    cours.text="";
                    date.text="";
                    prof.text="";
                    salle.text="";
                    type.text="";
                    Get.back();
                  }

                }, child: Text("Modifier",style: TextStyle(color: Colors.white),))

          ],
        ),
      );
    });
  }
  Future<void> updatemer([DocumentSnapshot?documentSnapshot])async{
    if(documentSnapshot!=null){
      cours.text = documentSnapshot['cours'];
      date.text = documentSnapshot['date'];
      prof.text = documentSnapshot['prof'];
      salle.text = documentSnapshot['salle'];
      type.text = documentSnapshot['type'];
    }
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
            Center(child: Text("Modifier",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            TextField(controller: cours,decoration: InputDecoration(
                labelText: "Cours",hintText: "cours",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: date,decoration: InputDecoration(
                labelText: "Date",hintText: "date",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: prof,decoration: InputDecoration(
                labelText: "Prof",hintText: "prof",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: salle,decoration: InputDecoration(
                labelText: "Salle",hintText: "salle",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: type,decoration: InputDecoration(
                labelText: "Type",hintText: "type",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                onPressed: ()async{
                  final String cour= cours.text;
                  final String dat = date.text;
                  final String pro = prof.text;
                  final String sall = salle.text;
                  final String typ = type.text;

                  if(cour!=null){
                    await _mercredi.doc(documentSnapshot?.id).update({"cours":cour,"date":dat,"prof":pro,"salle":sall,"type":typ});
                    cours.text="";
                    date.text="";
                    prof.text="";
                    salle.text="";
                    type.text="";
                    Get.back();
                  }

                }, child: Text("Modifier",style: TextStyle(color: Colors.white),))

          ],
        ),
      );
    });
  }
  Future<void> updatejeu([DocumentSnapshot?documentSnapshot])async{
    if(documentSnapshot!=null){
      cours.text = documentSnapshot['cours'];
      date.text = documentSnapshot['date'];
      prof.text = documentSnapshot['prof'];
      salle.text = documentSnapshot['salle'];
      type.text = documentSnapshot['type'];
    }
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
            Center(child: Text("Modifier",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            TextField(controller: cours,decoration: InputDecoration(
                labelText: "Cours",hintText: "cours",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: date,decoration: InputDecoration(
                labelText: "Date",hintText: "date",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: prof,decoration: InputDecoration(
                labelText: "Prof",hintText: "prof",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: salle,decoration: InputDecoration(
                labelText: "Salle",hintText: "salle",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: type,decoration: InputDecoration(
                labelText: "Type",hintText: "type",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                onPressed: ()async{
                  final String cour= cours.text;
                  final String dat = date.text;
                  final String pro = prof.text;
                  final String sall = salle.text;
                  final String typ = type.text;

                  if(cour!=null){
                    await _jeudi.doc(documentSnapshot?.id).update({"cours":cour,"date":dat,"prof":pro,"salle":sall,"type":typ});
                    cours.text="";
                    date.text="";
                    prof.text="";
                    salle.text="";
                    type.text="";
                    Get.back();
                  }

                }, child: Text("Modifier",style: TextStyle(color: Colors.white),))

          ],
        ),
      );
    });
  }
  Future<void> updateven([DocumentSnapshot?documentSnapshot])async{
    if(documentSnapshot!=null){
      cours.text = documentSnapshot['cours'];
      date.text = documentSnapshot['date'];
      prof.text = documentSnapshot['prof'];
      salle.text = documentSnapshot['salle'];
      type.text = documentSnapshot['type'];
    }
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
            Center(child: Text("Modifier",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            TextField(controller: cours,decoration: InputDecoration(
                labelText: "Cours",hintText: "cours",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: date,decoration: InputDecoration(
                labelText: "Date",hintText: "date",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: prof,decoration: InputDecoration(
                labelText: "Prof",hintText: "prof",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: salle,decoration: InputDecoration(
                labelText: "Salle",hintText: "salle",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: type,decoration: InputDecoration(
                labelText: "Type",hintText: "type",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                onPressed: ()async{
                  final String cour= cours.text;
                  final String dat = date.text;
                  final String pro = prof.text;
                  final String sall = salle.text;
                  final String typ = type.text;

                  if(cour!=null){
                    await _vendredi.doc(documentSnapshot?.id).update({"cours":cour,"date":dat,"prof":pro,"salle":sall,"type":typ});
                    cours.text="";
                    date.text="";
                    prof.text="";
                    salle.text="";
                    type.text="";
                    Get.back();
                  }

                }, child: Text("Modifier",style: TextStyle(color: Colors.white),))

          ],
        ),
      );
    });
  }
  Future<void> updatesam([DocumentSnapshot?documentSnapshot])async{
    if(documentSnapshot!=null){
      cours.text = documentSnapshot['cours'];
      date.text = documentSnapshot['date'];
      prof.text = documentSnapshot['prof'];
      salle.text = documentSnapshot['salle'];
      type.text = documentSnapshot['type'];
    }
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
            Center(child: Text("Modifier",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            TextField(controller: cours,decoration: InputDecoration(
                labelText: "Cours",hintText: "cours",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: date,decoration: InputDecoration(
                labelText: "Date",hintText: "date",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: prof,decoration: InputDecoration(
                labelText: "Prof",hintText: "prof",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: salle,decoration: InputDecoration(
                labelText: "Salle",hintText: "salle",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            TextField(controller: type,decoration: InputDecoration(
                labelText: "Type",hintText: "type",labelStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold)
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                onPressed: ()async{
                  final String cour= cours.text;
                  final String dat = date.text;
                  final String pro = prof.text;
                  final String sall = salle.text;
                  final String typ = type.text;

                  if(cour!=null){
                    await _samedi.doc(documentSnapshot?.id).update({"cours":cour,"date":dat,"prof":pro,"salle":sall,"type":typ});
                    cours.text="";
                    date.text="";
                    prof.text="";
                    salle.text="";
                    type.text="";
                    Get.back();
                  }

                }, child: Text("Modifier",style: TextStyle(color: Colors.white),))

          ],
        ),
      );
    });
  }
  Future<void> delete(String productID)async{
    await _cour.doc(productID).delete();
  }
  Future<void> deletem(String productID)async{
    await _mardi.doc(productID).delete();
  }
  Future<void> deletemer(String productID)async{
    await _mercredi.doc(productID).delete();
  }
  Future<void> deletejeu(String productID)async{
    await _jeudi.doc(productID).delete();
  }
  Future<void> deleteven(String productID)async{
    await _vendredi.doc(productID).delete();
  }
  Future<void> deletesam(String productID)async{
    await _samedi.doc(productID).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?Colors.black:Colors.grey[300],
      appBar: AppBar(
        flexibleSpace: ClipRect(child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 25,sigmaY: 25),
          child: Container(
            color: Colors.transparent,
          ),
        ),),
        elevation: 0,
        backgroundColor: Get.isDarkMode?Colors.black.withAlpha(1000):Colors.white.withAlpha(2000),
        leading:Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.only(left: 7),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(25),
        ),
        child: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios,size: 20,),
        ),
      ) ,),
      body:  Container(
        height: 7000,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Container(
                          width: 120,
                          padding: EdgeInsets.only(right: 4,left: 12),
                          decoration: BoxDecoration(
                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Lundi",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,color:Get.isDarkMode?Colors.black:Colors.white,),)),
                              role=="admin l3"?IconButton(onPressed: ()=> create(), icon: Icon(Icons.add_circle,color: Get.isDarkMode?Colors.black:Colors.white,)):IconButton(onPressed: ()=> null, icon: Icon(Icons.calendar_today,color: Get.isDarkMode?Colors.black:Colors.white,))
                            ],)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      //color: Colors.red,
                      child: StreamBuilder(stream: _cour.orderBy("time",descending: false).snapshots(), builder: (context,AsyncSnapshot<QuerySnapshot> streamsnapshot){
                        if(streamsnapshot.hasData){
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,

                              itemBuilder: (context,index){final DocumentSnapshot documentSnapshot = streamsnapshot.data!.docs[index];
                              return Card(
                                color: Get.isDarkMode?Colors.grey[900]:Colors.white,shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),margin: EdgeInsets.all(8),child: ListTile(
                                  leading: Column(

                                    children: [
                                      Icon(Icons.assignment_turned_in,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,),
                                      Text(documentSnapshot["type"].toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),)
                                    ],
                                  ),
                                  title: Text(documentSnapshot["cours"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5,),
                                      Text(documentSnapshot["prof"],style: TextStyle(color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),),
                                      SizedBox(height: 5,),
                                      Row(children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 1),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent
                                          ),child: Text(documentSnapshot["salle"],style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white,fontWeight: FontWeight.bold),),),
                                        SizedBox(width: 8,),
                                        Container(
                                          padding: EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 1),
                                          margin: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent
                                          ),child: Text(documentSnapshot["date"],style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white,fontWeight: FontWeight.bold),),),
                                        SizedBox(width: 8,),
                                      ],)
                                    ],),
                                  trailing:role=="admin l3"?SizedBox(
                                    width: 96,
                                    child:  Row(
                                      children: [
                                        IconButton(onPressed: ()=>update(documentSnapshot), icon: Icon(Icons.edit,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,size: 22,)),
                                        IconButton(onPressed: ()=>delete(documentSnapshot.id), icon: Icon(Icons.delete,color:Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,size: 22,)),
                                      ],),
                                  ):Container(width: 96,)
                              ),);
                              },
                              itemCount: streamsnapshot.data!.docs.length);
                        }
                        return  Center(child: CircularProgressIndicator(),);
                      }),
                    ),

                  ],
                ),

              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Container(
                          width: 120,
                          padding: EdgeInsets.only(right: 4,left: 12),
                          decoration: BoxDecoration(
                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Mardi",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,color:Get.isDarkMode?Colors.black:Colors.white,),)),
                              role=="admin l3"? IconButton(onPressed: ()=> createm(), icon: Icon(Icons.add_circle,color: Get.isDarkMode?Colors.black:Colors.white,)): IconButton(onPressed: ()=> null, icon: Icon(Icons.calendar_today,color: Get.isDarkMode?Colors.black:Colors.white,))
                            ],)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      //color: Colors.red,
                      child: StreamBuilder(stream: _mardi.orderBy("time",descending: false).snapshots(), builder: (context,AsyncSnapshot<QuerySnapshot> streamsnapshot){
                        if(streamsnapshot.hasData){
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,

                              itemBuilder: (context,index){final DocumentSnapshot documentSnapshot = streamsnapshot.data!.docs[index];
                              return Card(
                                color: Get.isDarkMode?Colors.grey[900]:Colors.white,shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),margin: EdgeInsets.all(8),child: ListTile(
                                  leading: Column(

                                    children: [
                                      Icon(Icons.assignment_turned_in,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,),
                                      Text(documentSnapshot["type"].toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),)
                                    ],
                                  ),
                                  title: Text(documentSnapshot["cours"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5,),
                                      Text(documentSnapshot["prof"],style: TextStyle(color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),),
                                      SizedBox(height: 5,),
                                      Row(children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 1),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent
                                          ),child: Text(documentSnapshot["salle"],style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white,fontWeight: FontWeight.bold),),),
                                        SizedBox(width: 8,),
                                        Container(
                                          padding: EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 1),
                                          margin: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent
                                          ),child: Text(documentSnapshot["date"],style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white,fontWeight: FontWeight.bold),),),
                                        SizedBox(width: 8,),
                                      ],)
                                    ],),
                                  trailing:role=="admin l3"?SizedBox(
                                    width: 96,
                                    child: Row(
                                      children: [
                                        IconButton(onPressed: ()=>updatem(documentSnapshot), icon: Icon(Icons.edit,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,size: 22,)),
                                        IconButton(onPressed: ()=>deletem(documentSnapshot.id), icon: Icon(Icons.delete,color:Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,size: 22,)),
                                      ],),
                                  ):Container(width: 96,)
                              ),);
                              },
                              itemCount: streamsnapshot.data!.docs.length);
                        }
                        return  Center(child: CircularProgressIndicator(),);
                      }),
                    ),

                  ],
                ),

              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Container(
                          width: 150,
                          padding: EdgeInsets.only(right: 4,left: 12),
                          decoration: BoxDecoration(
                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Mercredi",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,color:Get.isDarkMode?Colors.black:Colors.white,),)),
                              role=="admin l3"?IconButton(onPressed: ()=> createmer(), icon: Icon(Icons.add_circle,color: Get.isDarkMode?Colors.black:Colors.white,)):IconButton(onPressed: ()=> null, icon: Icon(Icons.calendar_today,color: Get.isDarkMode?Colors.black:Colors.white,))
                            ],)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      //color: Colors.red,
                      child: StreamBuilder(stream: _mercredi.orderBy("time",descending: false).snapshots(), builder: (context,AsyncSnapshot<QuerySnapshot> streamsnapshot){
                        if(streamsnapshot.hasData){
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,

                              itemBuilder: (context,index){final DocumentSnapshot documentSnapshot = streamsnapshot.data!.docs[index];
                              return Card(
                                color: Get.isDarkMode?Colors.grey[900]:Colors.white,shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),margin: EdgeInsets.all(8),child: ListTile(
                                  leading: Column(

                                    children: [
                                      Icon(Icons.assignment_turned_in,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,),
                                      Text(documentSnapshot["type"].toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),)
                                    ],
                                  ),
                                  title: Text(documentSnapshot["cours"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5,),
                                      Text(documentSnapshot["prof"],style: TextStyle(color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),),
                                      SizedBox(height: 5,),
                                      Row(children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 1),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent
                                          ),child: Text(documentSnapshot["salle"],style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white,fontWeight: FontWeight.bold),),),
                                        SizedBox(width: 8,),
                                        Container(
                                          padding: EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 1),
                                          margin: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent
                                          ),child: Text(documentSnapshot["date"],style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white,fontWeight: FontWeight.bold),),),
                                        SizedBox(width: 8,),
                                      ],)
                                    ],),
                                  trailing:role=="admin l3"?SizedBox(
                                    width: 96,
                                    child: Row(
                                      children: [
                                        IconButton(onPressed: ()=>updatemer(documentSnapshot), icon: Icon(Icons.edit,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,size: 22,)),
                                        IconButton(onPressed: ()=>deletemer(documentSnapshot.id), icon: Icon(Icons.delete,color:Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,size: 22,)),
                                      ],),
                                  ):Container(width: 96,)
                              ),);
                              },
                              itemCount: streamsnapshot.data!.docs.length);
                        }
                        return  Center(child: CircularProgressIndicator(),);
                      }),
                    ),

                  ],
                ),

              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Container(
                          width: 120,
                          padding: EdgeInsets.only(right: 4,left: 12),
                          decoration: BoxDecoration(
                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Jeudi",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,color:Get.isDarkMode?Colors.black:Colors.white,),)),
                              role=="admin l3"?IconButton(onPressed: ()=> createjeu(), icon: Icon(Icons.add_circle,color: Get.isDarkMode?Colors.black:Colors.white,)):IconButton(onPressed: ()=> null, icon: Icon(Icons.calendar_today,color: Get.isDarkMode?Colors.black:Colors.white,))
                            ],)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      //color: Colors.red,
                      child: StreamBuilder(stream: _jeudi.orderBy("time",descending: false).snapshots(), builder: (context,AsyncSnapshot<QuerySnapshot> streamsnapshot){
                        if(streamsnapshot.hasData){
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,

                              itemBuilder: (context,index){final DocumentSnapshot documentSnapshot = streamsnapshot.data!.docs[index];
                              return Card(
                                color: Get.isDarkMode?Colors.grey[900]:Colors.white,shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),margin: EdgeInsets.all(8),child: ListTile(
                                  leading: Column(

                                    children: [
                                      Icon(Icons.assignment_turned_in,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,),
                                      Text(documentSnapshot["type"].toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),)
                                    ],
                                  ),
                                  title: Text(documentSnapshot["cours"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5,),
                                      Text(documentSnapshot["prof"],style: TextStyle(color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),),
                                      SizedBox(height: 5,),
                                      Row(children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 1),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent
                                          ),child: Text(documentSnapshot["salle"],style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white,fontWeight: FontWeight.bold),),),
                                        SizedBox(width: 8,),
                                        Container(
                                          padding: EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 1),
                                          margin: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent
                                          ),child: Text(documentSnapshot["date"],style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white,fontWeight: FontWeight.bold),),),
                                        SizedBox(width: 8,),
                                      ],)
                                    ],),
                                  trailing:role=="admin l3"?SizedBox(
                                    width: 96,
                                    child: Row(
                                      children: [
                                        IconButton(onPressed: ()=>updatejeu(documentSnapshot), icon: Icon(Icons.edit,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,size: 22,)),
                                        IconButton(onPressed: ()=>deletejeu(documentSnapshot.id), icon: Icon(Icons.delete,color:Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,size: 22,)),
                                      ],),
                                  ):Container(width: 96,)
                              ),);
                              },
                              itemCount: streamsnapshot.data!.docs.length);
                        }
                        return  Center(child: CircularProgressIndicator(),);
                      }),
                    ),

                  ],
                ),

              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Container(
                          width: 150,
                          padding: EdgeInsets.only(right: 4,left: 12),
                          decoration: BoxDecoration(
                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Vendredi",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,color:Get.isDarkMode?Colors.black:Colors.white,),)),
                              role=="admin l3"?IconButton(onPressed: ()=>createven(), icon: Icon(Icons.add_circle,color: Get.isDarkMode?Colors.black:Colors.white,)):IconButton(onPressed: ()=>null, icon: Icon(Icons.calendar_today,color: Get.isDarkMode?Colors.black:Colors.white,))
                            ],)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      //color: Colors.red,
                      child: StreamBuilder(stream: _vendredi.orderBy("time",descending: false).snapshots(), builder: (context,AsyncSnapshot<QuerySnapshot> streamsnapshot){
                        if(streamsnapshot.hasData){
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,

                              itemBuilder: (context,index){final DocumentSnapshot documentSnapshot = streamsnapshot.data!.docs[index];
                              return Card(
                                color: Get.isDarkMode?Colors.grey[900]:Colors.white,shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),margin: EdgeInsets.all(8),child: ListTile(
                                  leading: Column(

                                    children: [
                                      Icon(Icons.assignment_turned_in,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,),
                                      Text(documentSnapshot["type"].toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),)
                                    ],
                                  ),
                                  title: Text(documentSnapshot["cours"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5,),
                                      Text(documentSnapshot["prof"],style: TextStyle(color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),),
                                      SizedBox(height: 5,),
                                      Row(children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 1),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent
                                          ),child: Text(documentSnapshot["salle"],style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white,fontWeight: FontWeight.bold),),),
                                        SizedBox(width: 8,),
                                        Container(
                                          padding: EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 1),
                                          margin: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent
                                          ),child: Text(documentSnapshot["date"],style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white,fontWeight: FontWeight.bold),),),
                                        SizedBox(width: 8,),
                                      ],)
                                    ],),
                                  trailing:role=="admin l3"?SizedBox(
                                    width: 96,
                                    child: Row(
                                      children: [
                                        IconButton(onPressed: ()=>updateven(documentSnapshot), icon: Icon(Icons.edit,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,size: 22,)),
                                        IconButton(onPressed: ()=>deleteven(documentSnapshot.id), icon: Icon(Icons.delete,color:Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,size: 22,)),
                                      ],),
                                  ):Container(width: 96,)
                              ),);
                              },
                              itemCount: streamsnapshot.data!.docs.length);
                        }
                        return  Center(child: CircularProgressIndicator(),);
                      }),
                    ),

                  ],
                ),

              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Container(
                          width: 150,
                          padding: EdgeInsets.only(right: 4,left: 12),
                          decoration: BoxDecoration(
                              color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Samedi",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,color:Get.isDarkMode?Colors.black:Colors.white,),)),
                              role=="admin l3"?IconButton(onPressed: ()=>createsam(), icon: Icon(Icons.add_circle,color: Get.isDarkMode?Colors.black:Colors.white,)):IconButton(onPressed: ()=>null, icon: Icon(Icons.calendar_today,color: Get.isDarkMode?Colors.black:Colors.white,))
                            ],)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      //color: Colors.red,
                      child: StreamBuilder(stream: _samedi.orderBy("time",descending: false).snapshots(), builder: (context,AsyncSnapshot<QuerySnapshot> streamsnapshot){
                        if(streamsnapshot.hasData){
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,

                              itemBuilder: (context,index){final DocumentSnapshot documentSnapshot = streamsnapshot.data!.docs[index];
                              return Card(
                                color: Get.isDarkMode?Colors.grey[900]:Colors.white,shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),margin: EdgeInsets.all(8),child: ListTile(
                                leading: Column(

                                  children: [
                                    Icon(Icons.assignment_turned_in,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,),
                                    Text(documentSnapshot["type"].toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),)
                                  ],
                                ),
                                title: Text(documentSnapshot["cours"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Text(documentSnapshot["prof"],style: TextStyle(color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent),),
                                    SizedBox(height: 5,),
                                    Row(children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 1),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent
                                        ),child: Text(documentSnapshot["salle"],style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white,fontWeight: FontWeight.bold),),),
                                      SizedBox(width: 8,),
                                      Container(
                                        padding: EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 1),
                                        margin: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent
                                        ),child: Text(documentSnapshot["date"],style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white,fontWeight: FontWeight.bold),),),

                                    ],)
                                  ],),
                                trailing:role=="admin l3"?SizedBox(
                                  width: 96,
                                  child: Row(
                                    children: [
                                      IconButton(onPressed: ()=>updatesam(documentSnapshot), icon: Icon(Icons.edit,color: Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,size: 22,)),
                                      IconButton(onPressed: ()=>deletesam(documentSnapshot.id), icon: Icon(Icons.delete,color:Get.isDarkMode?Colors.yellowAccent:Colors.deepPurpleAccent,size: 22,)),
                                    ],),
                                ):Container(width: 96,),
                                ),);
                              },
                              itemCount: streamsnapshot.data!.docs.length);
                        }
                        return  Center(child: CircularProgressIndicator(),);
                      }),
                    ),

                  ],
                ),

              ),

            ],
          ),
        ),
      ),

    );
  }
}
