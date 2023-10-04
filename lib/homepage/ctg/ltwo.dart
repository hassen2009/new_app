import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../EEa/homes/homes1.dart';
class Ea extends StatefulWidget {
  Ea({Key? key}) : super(key: key);

  @override
  State<Ea> createState() => _EaState();
}

class _EaState extends State<Ea> {
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
  }
  CollectionReference hsnre = FirebaseFirestore.instance.collection("events2");
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
              "EEA L3 ",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins-Bold",
                  color: Theme.of(context).colorScheme.tertiary
              ),),

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
                                      child:Text("Semestre 5",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 25)),),
                                      onPressed: (){},
                                    ),
                                    SizedBox(height: 15,),
                                    OutlinedButton(style: OutlinedButton.styleFrom(
                                        minimumSize: Size.fromHeight(40),
                                        elevation: 0,
                                        textStyle: TextStyle(fontSize: 28),
                                        side:BorderSide(width: 1,color: Colors.blue)

                                    ),
                                      child:Text("Semestre 6",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 25)),),
                                      onPressed: (){},
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Get.isDarkMode?Colors.black:Colors.grey[100],
                              child: StreamBuilder(
                                stream: hsnre.snapshots(),
                                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                                  if(snapshot.connectionState==ConnectionState.waiting){
                                    return Center(child: CircularProgressIndicator());
                                  }
                                  if(!snapshot.hasData){
                                    return Center(child: Text("Aucun rattrapage"));
                                  }
                                  List<dynamic> evnt2 =[];
                                  snapshot.data!.docs.forEach((element) {
                                    evnt2.add(element);
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
                                          itemCount: evnt2.length,
                                          itemBuilder: (context,index){
                                            final event2 = evnt2[index];
                                            final Nom = event2['Nom'];
                                            final Timestamp timestamp = event2['date'];
                                            final String date = DateFormat.yMMMEd('fr-FR').format(timestamp.toDate());
                                            final matiere = event2['matiere'];
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
                              child: role=='admin l3'?Dtt():Container(
                                child: Center(
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
                                      Text("Seule le délégué a l'accès pour cette page",
                                        style:TextStyle(
                                          color: Get.isDarkMode?Colors.grey[300]:Colors.grey[600],
                                          fontSize: 16,

                                        ) ,)
                                    ],
                                  ),
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


