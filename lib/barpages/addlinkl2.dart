import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class linkl2 extends StatefulWidget {
  const linkl2({Key? key}) : super(key: key);

  @override
  State<linkl2> createState() => _linkl2State();
}

class _linkl2State extends State<linkl2> {

  final _formkey = GlobalKey<FormState>();
  final linkb = TextEditingController();
  final desb = TextEditingController();
  DateTime telected = DateTime.now();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    linkb.dispose();
    desb.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Text("Lien", style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              )),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Text("Ajoutez un lien", style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Get.isDarkMode ? Colors.grey[300] : Colors.grey[600]
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepPurpleAccent.withOpacity(0.15)
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Lien",
                              labelStyle: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .tertiary,
                                  fontSize: 15
                              ),
                              hintText: "Ajoutez un lien",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 1
                                  )
                              )
                          ),
                          controller: linkb,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Completer le champ";
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 14,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepPurpleAccent.withOpacity(0.15)
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Description",
                              labelStyle: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .tertiary,
                                  fontSize: 15
                              ),
                              hintText: "Description",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 1
                                  )
                              )
                          ),
                          controller: desb,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Completer le champ";
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 14,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent[200]
                        ),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            final linkcont = linkb.text;
                            final desccont = desb.text;
                            CollectionReference link = FirebaseFirestore.instance.collection("linkl2");
                            await link.add({
                              'desc': desccont,
                              'link': linkcont
                            }
                            ).then((value) => print("link added"));
                          }
                        },
                        child: Text("Envoyer", style: TextStyle(
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