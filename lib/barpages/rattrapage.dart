import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:new_app/empl/theme.dart';

import '../EEa/homes/btneea.dart';

class conference extends StatefulWidget {
  conference({Key? key}) : super(key: key);

  @override
  State<conference> createState() => _conferenceState();
}

class _conferenceState extends State<conference> {
  CollectionReference hsnref = FirebaseFirestore.instance.collection("events");

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: StreamBuilder(
          stream: hsnref.snapshots(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: CupertinoColors.systemBlue,));
            }
            if(!snapshot.hasData){
              return Center(child: Text("Aucun rattrapage"));
            }
            List<dynamic> events =[];
            snapshot.data!.docs.forEach((element) {
              events.add(element);
            });
            return ListView.builder(
              padding:EdgeInsets.all(10) ,
              itemCount: events.length,
              itemBuilder: (context,index){
                final event = events[index];
                final Nom = event['Nom'];
                final Timestamp timestamp = event['date'];
                final String date = DateFormat.yMd().add_jm().format(timestamp.toDate());
                final matiere = event['matiere'];
                return Card(
                  child: ListTile(
                    title: Text("$matiere ($date)",style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        )
                    ),),
                    subtitle: Text("$Nom",style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                        )
                    ),),
                    trailing:IconButton(onPressed: (){FirebaseFirestore.instance.collection("events").doc(snapshot.data!.docs[index]["id"]);}, icon: Icon(Icons.delete,color: Colors.red[900],)),
                  ),
                );
              },
            );
          } ,
        )

    );
  }
}
