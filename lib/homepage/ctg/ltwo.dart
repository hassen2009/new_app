import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/base/lcl.dart';

import '../../EEa/homes/btneea.dart';
class adminornot extends StatefulWidget {
  const adminornot({super.key});

  @override
  State<adminornot> createState() => _adminornotState();
}

class _adminornotState extends State<adminornot> {
  String role = "user";
  @override
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
    if(role=='user'){Timer(Duration(milliseconds:500), () { Get.to(()=>nothing());});} else if(role =="admin"){Timer(Duration(milliseconds:500), () { Get.to(()=>dteea());});}
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(child: Text("Waitting... "),),
    );
  }
}
