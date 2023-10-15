import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:new_app/EEa/homes/btneea.dart';
import 'package:new_app/homepage/ctg/Semestres/semestre4/s3.dart';
import 'package:new_app/homepage/ctg/ltwo.dart';
import '../../EEa/homes/homes2.dart';
import '../../empl/empl1.dart';
import '../pages.dart';
import 'Semestres/semestre4/s4.dart';
class Eea extends StatefulWidget {
   Eea({Key? key}) : super(key: key);

  @override
  State<Eea> createState() => _EeaState();
}

class _EeaState extends State<Eea> {
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
  CollectionReference hsnref = FirebaseFirestore.instance.collection("events");
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Text(
              "E.E.A  L2",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins-Bold",
                  color: Theme.of(context).colorScheme.tertiary
              ),),
          ),
          elevation: 0,
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
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height:701,
                child: Column(
                  children: [
                    TabBar(
                        tabs: [ Tab(
                          icon: Icon(Icons.home_outlined,color:Theme.of(context).colorScheme.tertiary,size: 25,)),
                          Tab(
                              icon: Icon(Icons.schedule_outlined,color:Theme.of(context).colorScheme.tertiary,size: 25,),

                          ),

                          Tab(
                            icon: Icon(Icons.add,color:Theme.of(context).colorScheme.tertiary,size: 25,),

                          ),

                        ]
                    ),
                    Expanded(
                      child: TabBarView(
                          children: [
                            Container(
                              child: SingleChildScrollView(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   Container(
                                     child:  Text("Semestres",style: GoogleFonts.lato(
                                    textStyle : TextStyle(
                                        fontSize: 30,
                                        fontWeight:  FontWeight.bold,
                                    )
                                   )),
                                   ),
                                    SizedBox(height: 5,),
                                    Container(
                                      child:  Text("Choissisez un semestre",style: GoogleFonts.lato(
                                          textStyle : TextStyle(
                                            fontSize: 17,
                                            fontWeight:  FontWeight.normal,
                                            color: Colors.grey[600]
                                          )
                                      )),
                                    ),

                                    SizedBox(height: 30,),
                                    OutlinedButton(style: OutlinedButton.styleFrom(
                                      minimumSize: Size.fromHeight(40),
                                      elevation: 0,
                                      textStyle: TextStyle(fontSize: 28),
                                      side:BorderSide(width: 1,color: Colors.blue)

                                    ),
                                        child:Text("Semestre 3",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 25)),),
                                      onPressed: (){Get.to(()=>Semestre3());},
                                    ),
                                    SizedBox(height: 15,),
                                    OutlinedButton(style: OutlinedButton.styleFrom(
                                        minimumSize: Size.fromHeight(40),
                                        elevation: 0,
                                        textStyle: TextStyle(fontSize: 28),
                                        side:BorderSide(width: 1,color: Colors.blue)

                                    ),
                                      child:Text("Semestre 4",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 25)),),
                                      onPressed: (){Get.to(()=>Semestre4());},
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Get.isDarkMode?Colors.black:Colors.grey[100],
                             child: StreamBuilder(
                               stream: hsnref.snapshots(),
                               builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                                 if(snapshot.connectionState==ConnectionState.waiting){
                                   return Center(child: CircularProgressIndicator());
                                 }
                                 if(!snapshot.hasData){
                                   return Center(child: Text("Aucun rattrapage"));
                                 }
                                 List<dynamic> events =[];
                                 snapshot.data!.docs.forEach((element) {
                                   events.add(element);
                                 });
                                 return Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(20),
                                       child: Text("À rattraper",style: GoogleFonts.lato(
                                           textStyle: TextStyle(
                                               fontSize: 28,
                                               fontWeight: FontWeight.bold,
                                               color: Get.isDarkMode?Colors.yellow[500]:Colors.deepPurple
                                           )
                                       ),),
                                     ),
                                     Expanded(
                                       child: ListView.builder(
                                         padding:EdgeInsets.all(10) ,
                                         itemCount: events.length,
                                         itemBuilder: (context,index){
                                           final event = events[index];
                                           final Nom = event['Nom'];
                                           final Timestamp timestamp = event['date'];
                                           final String date = DateFormat.yMMMEd('fr-FR').format(timestamp.toDate());
                                           final matiere = event['matiere'];
                                           return SingleChildScrollView(
                                             child: Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                             SizedBox(height: 8,),
                                             Card(
                                               color: Get.isDarkMode?Colors.grey[900]:Colors.white,
                                               child: ListTile(
                                                 title: Row(
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                   children: [
                                                     Text("$matiere  ",style: GoogleFonts.lato(
                                                         textStyle: TextStyle(
                                                             fontSize: 18,
                                                             fontWeight: FontWeight.bold,
                                                             color: Get.isDarkMode?Colors.yellow[500]:Colors.deepPurple
                                                         )
                                                     ),),
                                                     Text("$date",style: GoogleFonts.lato(
                                                         textStyle: TextStyle(
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.bold,
                                                             color: Get.isDarkMode?Colors.white:Colors.black
                                                         )
                                                     ),),
                                                   ],
                                                 ),
                                                 subtitle: Text("$Nom",style: GoogleFonts.lato(
                                                     textStyle: TextStyle(
                                                         fontSize: 15,
                                                         fontWeight: FontWeight.normal
                                                     )
                                                 ),),
                                                 leading: Icon(Get.isDarkMode?Icons.timer_outlined:Icons.timer,color: Get.isDarkMode?Colors.yellow[500]:Colors.deepPurple),
                                               ),

                                             )
                                               ],
                                             ),
                                           );
                                         },
                                       ),
                                     ),
                                   ],
                                 );
                               } ,
                             ),

                            ),
                            Container(
                              child: role=='admin'?const dteea():Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.warning_amber,
                                      size: 60,
                                      color: Get.isDarkMode?Colors.deepOrangeAccent:Colors.deepPurpleAccent[200],
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Seul  délégué L2 a l'accès à cette page",
                                      style:TextStyle(
                                        color: Get.isDarkMode?Colors.grey[300]:Colors.grey[600],
                                        fontSize: 16,

                                      ) ,)
                                  ],
                                ),
                              ),
                            )
                      ]
                      ),
                    )
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

