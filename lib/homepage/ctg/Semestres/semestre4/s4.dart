import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/homepage/ctg/lone.dart';
import 'package:new_app/homepage/home_page.dart';
import 'package:new_app/main.dart';
import 'ctdpa.dart';
class Semestre4  extends StatelessWidget {
  const Semestre4({Key? key}) : super(key: key);

  @override
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
        title: Text("S4"),
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
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Semestre 4",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold)),),
              SizedBox(height: 30,),
              OutlinedButton(style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  elevation: 0,
                  textStyle: TextStyle(fontSize: 28),
                  side:BorderSide(width: 1,color: Colors.blue)

              ),
                child:Text("Eléctronique Analogique ||",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.normal)),),
                onPressed: (){Get.to(roles());},
              ),
              SizedBox(height: 15,),
              OutlinedButton(style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  elevation: 0,
                  textStyle: TextStyle(fontSize: 28),
                  side:BorderSide(width: 1,color: Colors.blue)

              ),
                child:Text("Schéma et sécurité électrique",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.normal)),),
                onPressed: (){},
              ),
              SizedBox(height: 15,),
              OutlinedButton(style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  elevation: 0,
                  textStyle: TextStyle(fontSize: 28),
                  side:BorderSide(width: 1,color: Colors.blue)

              ),
                child:Text("Circuit électrique",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.normal)),),
                onPressed: (){},
              ),
              SizedBox(height: 15,),
              OutlinedButton(style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  elevation: 0,
                  textStyle: TextStyle(fontSize: 28),
                  side:BorderSide(width: 1,color: Colors.blue)

              ),
                child:Text("Machine électrique ||",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.normal)),),
                onPressed: (){},
              ),
              SizedBox(height: 15,),
              OutlinedButton(style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  elevation: 0,
                  textStyle: TextStyle(fontSize: 28),
                  side:BorderSide(width: 1,color: Colors.blue)

              ),
                child:Text("Thermodynamique",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.normal)),),
                onPressed: (){},
              ),
              SizedBox(height: 15,),
              OutlinedButton(style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  elevation: 0,
                  textStyle: TextStyle(fontSize: 28),
                  side:BorderSide(width: 1,color: Colors.blue)

              ),
                child:Text("Analyse des systèmes linéaires",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.normal)),),
                onPressed: (){},
              ),
              SizedBox(height: 15,),
              OutlinedButton(style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  elevation: 0,
                  textStyle: TextStyle(fontSize: 28),
                  side:BorderSide(width: 1,color: Colors.blue)

              ),
                child:Text("Traitement du signal",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.normal)),),
                onPressed: (){},
              ),
              SizedBox(height: 15,),
              OutlinedButton(style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  elevation: 0,
                  textStyle: TextStyle(fontSize: 28),
                  side:BorderSide(width: 1,color: Colors.blue)

              ),
                child:Text("Français",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.normal)),),
                onPressed: (){},
              ),
              SizedBox(height: 15,),
              OutlinedButton(style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  elevation: 0,
                  textStyle: TextStyle(fontSize: 28),
                  side:BorderSide(width: 1,color: Colors.blue)

              ),
                child:Text("Anglais",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.normal)),),
                onPressed: (){},
              ),



            ],
          ),
        ),
      )
    );
  }
}