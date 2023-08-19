import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/empl/empl1.dart';
import 'package:new_app/empl/mtrbtn.dart';
import 'package:new_app/homepage/ctg/lone.dart';
import 'package:new_app/homepage/home_page.dart';
class dteea extends StatefulWidget {
  const dteea({Key? key}) : super(key: key);

  @override
  State<dteea> createState() => _dteeaState();
}

class _dteeaState extends State<dteea> {

  final _formkey = GlobalKey<FormState>();
  final mtrconf = TextEditingController();
  final profconf = TextEditingController();
  DateTime telected= DateTime.now();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mtrconf.dispose();
    profconf.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: Get.isDarkMode?Colors.grey[900]:Colors.grey[300],
            borderRadius: BorderRadius.circular(25),
          ),
          child: GestureDetector(
            onTap: (){
              Get.to(()=>HomePge());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 11.0),
              child: Icon(Icons.home_filled,size: 20,color: CupertinoColors.activeBlue,),
            ),
          ),
        ),],
      ),
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Text("Délégué Page",style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                )),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Text("Ajouter un rattrapage",style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Get.isDarkMode?Colors.grey[300]:Colors.grey[600]
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Matière",
                                labelStyle: TextStyle(
                                    color: Theme.of(context).colorScheme.tertiary,
                                    fontSize: 15
                                ),
                                hintText: "Ajouter une matiere",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 1
                                    )
                                )
                            ),
                            controller:mtrconf ,
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return "Completer le champ";
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 14,),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Nom du professeur",
                                labelStyle: TextStyle(
                                    color: Theme.of(context).colorScheme.tertiary,
                                    fontSize: 15
                                ),
                                hintText: "Ajouter un nom",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 1
                                    )
                                )
                            ),
                            controller:profconf ,
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return "Completer le champ";
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 14,),
                        DateTimeFormField(
                          decoration:  InputDecoration(
                            hintStyle: TextStyle(color: Colors.black45),
                            errorStyle: TextStyle(color: Colors.redAccent),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            suffixIcon: Icon(Icons.event_note),
                            labelText: 'Ajouter une date',
                          ),
                          mode: DateTimeFieldPickerMode.dateAndTime,
                          autovalidateMode: AutovalidateMode.always,
                          validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                          onDateSelected: (DateTime value) {
                            setState(() {
                              telected=value;
                            });
                          },
                        ),
                        SizedBox(height: 14,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent[200]
                          ),
                          onPressed: () async{
                          if(_formkey.currentState!.validate()){
                            final mtrconfcontroller = mtrconf.text;
                            final profcontroller = profconf.text;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Envoi en cours...")));
                            FocusScope.of(context).requestFocus(FocusNode());
                            CollectionReference events = FirebaseFirestore.instance.collection("events");
                            await events.add({
                              'Nom':profcontroller,
                              'date':telected,
                              'matiere':mtrconfcontroller
                            }
                            ).then((value) => print("doc added"));
                          }
                        },
                          child: Text("Envoyer",style: TextStyle(
                            color: Colors.white,
                          ),),
                        )
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
    );

  }
}
