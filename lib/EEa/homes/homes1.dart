import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:new_app/empl/imput2.dart';
class Dtt extends StatefulWidget {
  const Dtt({Key? key}) : super(key: key);

  @override
  State<Dtt> createState() => _DttState();
}

class _DttState extends State<Dtt> {

  final _formkey2 = GlobalKey<FormState>();
  final mtrcon = TextEditingController();
  final profcon = TextEditingController();
  DateTime telecte= DateTime.now();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mtrcon.dispose();
    profcon.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Text("Rattrapage",style: GoogleFonts.lato(
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
                  key: _formkey2,
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
                              labelText: "Matière",
                              labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 15
                              ),
                              hintText: "Ajouter une matiere",
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
                          controller:mtrcon,
                          validator: (value){
                            if(value==null||value.isEmpty){
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
                              labelText: "Nom du professeur",
                              labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 15
                              ),
                              hintText: "Ajouter un nom",
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
                          controller:profcon ,
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return "Completer le champ";
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 14,),
                      Myinputfielduser(hint: DateFormat.yMd().format(telecte),
                          widget: IconButton(
                            icon: Icon(Icons.calendar_today_outlined,color: Colors.grey,),
                            onPressed: (){
                              _getdate();
                            },
                          )
                      ),
                      SizedBox(height: 14,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent[200]
                        ),
                        onPressed: () async{
                          if(_formkey2.currentState!.validate()){
                            final mtrconfcontroller2 = mtrcon.text;
                            final profcontroller2 = profcon.text;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Envoi en cours...")));
                            FocusScope.of(context).requestFocus(FocusNode());
                            CollectionReference evnt = FirebaseFirestore.instance.collection("events2");
                            await evnt.add({
                              'Nom':profcontroller2,
                              'date':telecte,
                              'matiere':mtrconfcontroller2
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
  _getdate() async {
    DateTime? _pickerdate = await  showRoundedDatePicker(
        context: context,
        height: 320,
        locale: Locale("fr","FR"),
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        styleDatePicker: MaterialRoundedDatePickerStyle(
          textStyleDayButton: TextStyle(fontSize: 30, color: Colors.white),
          textStyleYearButton: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          textStyleDayHeader: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          textStyleCurrentDayOnCalendar:
          TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          textStyleDayOnCalendar: TextStyle(fontSize: 20, color: Colors.white),
          textStyleDayOnCalendarSelected:
          TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          textStyleDayOnCalendarDisabled: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.1)),
          textStyleMonthYearHeader:
          TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          sizeArrow: 30,
          colorArrowNext: Colors.white,
          colorArrowPrevious: Colors.white,
          textStyleButtonAction: TextStyle(fontSize: 18, color: Colors.white),
          textStyleButtonPositive:
          TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          textStyleButtonNegative: TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.5)),
          decorationDateSelected: BoxDecoration(color: Get.isDarkMode?Colors.deepPurple:Colors.orange[600], shape: BoxShape.circle),
          backgroundPicker: Get.isDarkMode?Colors.black:Colors.deepPurple[400],
          backgroundActionBar: Get.isDarkMode?Colors.grey[900]:Colors.deepPurple[300],
          backgroundHeaderMonth: Get.isDarkMode?Colors.grey[900]:Colors.deepPurple[300],
        ),
        styleYearPicker: MaterialRoundedYearPickerStyle(
          textStyleYear: TextStyle(fontSize: 35, color: Colors.white),
          textStyleYearSelected:
          TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          heightYearRow: 40,
          backgroundPicker: Get.isDarkMode?Colors.black:Colors.deepPurple[400],
        ));
    if(_pickerdate!=null){
      setState(() {
        telecte =  _pickerdate;
      });
    }
    else{
      print("erreur");
    }
  }
}
