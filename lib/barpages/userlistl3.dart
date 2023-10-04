import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class Userlistl3 extends StatefulWidget {
  const Userlistl3({super.key});

  @override
  State<Userlistl3> createState() => _Userlistl3State();
}
final CollectionReference userref = FirebaseFirestore.instance.collection("users");
class _Userlistl3State extends State<Userlistl3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: StreamBuilder(
        stream: userref.where("typel",isEqualTo: "L3").snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(!snapshot.hasData){
            return Center(child: Text("Aucun rattrapage"));
          }
          List<dynamic> users =[];
          snapshot.data!.docs.forEach((element) {
            users.add(element);
          });
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("EEA L3",style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Get.isDarkMode?Colors.yellow[500]:Colors.deepPurple
                        )
                    ),),
                    SizedBox(height: 30,),
                    Container(
                      color: Get.isDarkMode?Colors.grey[900]:Colors.grey[300],
                      padding: const EdgeInsets.only(left: 10,right: 90),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Matricule",style: TextStyle(fontSize: 16),),
                          Text("Nom & Prenom",style: TextStyle(fontSize: 16),)
                        ],),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding:EdgeInsets.all(10) ,
                  itemCount: users.length,
                  itemBuilder: (context,index){
                    final user = users[index];
                    final Nom = user['name'];
                    final Uid =  user['bio'];
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 0,),
                          Card(
                            shadowColor: Get.isDarkMode?Colors.white38:Colors.black38,
                            color: Get.isDarkMode?Colors.black:Colors.white,
                            child: ListTile(
                              title:
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("$Uid",style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal
                                        )
                                    ),),
                                    SizedBox(width: 20,),
                                    Container(height: 50,width: 1,color: Get.isDarkMode?Colors.grey[900]:Colors.grey[300],),
                                    SizedBox(width: 30,),
                                    Text("$Nom",style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,

                                        )
                                    ),textAlign: TextAlign.center,maxLines: 1,)

                                  ],
                                ),
                              ),
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
    );
  }
}
