import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class todayl2 extends StatefulWidget {
  const todayl2({super.key});

  @override
  State<todayl2> createState() => _todayState();
}

class _todayState extends State<todayl2> {
  String x = DateFormat("EEEE").format(DateTime.now());
  final CollectionReference _cour = FirebaseFirestore.instance.collection("lundil2");
  final CollectionReference _mardi = FirebaseFirestore.instance.collection("mardil2");
  final CollectionReference _mercredi = FirebaseFirestore.instance.collection("mercredil2");
  final CollectionReference _jeudi = FirebaseFirestore.instance.collection("jeudil2");
  final CollectionReference _vendredi = FirebaseFirestore.instance.collection("vendredil2");
  final CollectionReference _samedi = FirebaseFirestore.instance.collection("samedil2");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ) ,
      ),
      body: Container(
        height: 7000,
        color: Get.isDarkMode?Colors.grey[900]:Colors.grey[300],
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
                              Text(x=="Monday"?"Lundi":x=="Tuesday"?"Mardi":x=="Wednesday"?"Mercredi":x=="Thursday"?"Jeudi":x=="Friday"?"Vendredi":x=="Saturday"?"Samedi":"Samedi",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,color:Get.isDarkMode?Colors.black:Colors.white,),)),
                              IconButton(onPressed: ()=> null, icon: Icon(Icons.calendar_today,color: Get.isDarkMode?Colors.black:Colors.white,))
                            ],)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: StreamBuilder(stream: (x=="Monday"?_cour:x=="Tuesday"?_mardi:x=="Wednesday"?_mercredi:x=="Thursday"?_jeudi:x=="Friday"?_vendredi:x=="Saturday"?_samedi:_samedi).orderBy("time",descending: false).snapshots(), builder: (context,AsyncSnapshot<QuerySnapshot> streamsnapshot){
                        if(streamsnapshot.hasData){
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,

                              itemBuilder: (context,index){
                                final DocumentSnapshot documentSnapshot = streamsnapshot.data!.docs[index];
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
                                    trailing:Container(width: 96,)
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
