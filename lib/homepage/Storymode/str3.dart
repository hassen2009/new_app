import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class stat extends StatefulWidget {
  const stat({super.key,});

  @override
  State<stat> createState() => _statState();
}

class _statState extends State<stat> {
  String role = "user";
  void initState(){
    super.initState();
    _checkRole();
  }
  _checkRole()async{
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance.collection("users").doc(user?.uid).get();
    setState((){
      role = snap['role'];
    });
  }
  final _formkey = GlobalKey<FormState>();
  TextEditingController stattext = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stattext.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurpleAccent

              ),
              child: GestureDetector(
                onTap: ()async{
                  if(_formkey.currentState!.validate()){
                    final strbutton = stattext.text;
                    final strbutton2 = stattext.text;
                    DateTime dt = DateTime.now();
                    final String date = DateFormat.jm().format(dt);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Envoi en cours...")));
                    FocusScope.of(context).requestFocus(FocusNode());
                    if(role=="admin l3"){
                      CollectionReference strr = FirebaseFirestore.instance.collection("story2");
                      await strr.add({
                        'story2':strbutton2,
                        "time": date
                      }
                      ).then((value) {
                        Get.back();
                      });
                    }
                    else{
                      CollectionReference str = FirebaseFirestore.instance.collection("story");
                      await str.add({
                        'story':strbutton,
                        "time": date
                      }
                      ).then((value){
                        Get.back();
                      });
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all( 5),
                  child: Icon(Icons.publish,color: Colors.white,),
                ),
              )
          )
        ],
        leading: Container(
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
        ),
      ),
      body:  Form(
        key: _formkey,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: TextFormField(
                controller: stattext,

              validator: (value){
                if(value==null||value.isEmpty){
                  return "Completer le champ";
                }
              },
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:
                      Get.isDarkMode?Colors.white:Colors.black
                  )
              ),
              decoration: InputDecoration(
              hintText: "Ajoutez un statut",
              border: InputBorder.none,
              hintStyle: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode?Colors.grey[600]:Colors.grey[600]

                  ),

              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  width: 0,
                ),
              ),
            ),
            ),
          ),
        ),
      ),
    );
  }
}
