import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/homepage/home_page.dart';
import 'addtocourss5.dart';
import 'addtotdss5.dart';
class Semestre5  extends StatelessWidget {
  const Semestre5({Key? key}) : super(key: key);
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
          title: Text("S5"),
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
                Text("Semestre 5",style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold)),),
                SizedBox(height: 30,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Get.isDarkMode?Colors.grey[900]:Colors.grey[300],
                    ),
                    onPressed: (){Get.to(addtocours5());}, child: Text("Cours",style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black),)
                ),
                SizedBox(height: 15,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Get.isDarkMode?Colors.grey[900]:Colors.grey[300]
                    ),
                    onPressed: (){Get.to(()=>addtotds5());}, child: Text("TD",style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black),)
                ),

              ],
            ),
          ),
        )
    );
  }
}