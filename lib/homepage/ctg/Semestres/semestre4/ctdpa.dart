import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../home_page.dart';
import 'addone.dart';
class roles extends StatelessWidget {
  const roles({Key? key}) : super(key: key);

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
        title: Text("Electronique Abalogique"),
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
     body: SingleChildScrollView(
       child: Column(
         children: [
           Container(
             height: 700,
             color: Get.isDarkMode?Colors.black:Colors.white,
             padding: EdgeInsets.all(20),
             margin: EdgeInsets.symmetric(vertical: 15),
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   ElevatedButton(
                       onPressed: (){Get.to(addone());}, child: Text("Cours",style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.white),)
                   ),
                   SizedBox(height: 15,),
                   ElevatedButton(
                       onPressed: (){}, child: Text("TD",style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.white),)
                   ),

                   SizedBox(height: 15,),
                   ElevatedButton(
                       onPressed: (){}, child: Text("TP",style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.white),)
                   ),

                   SizedBox(height: 15,),
                   ElevatedButton(
                       onPressed: (){}, child: Text("Archive",style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.white),)
                   ),

                 ],
               ),
             ),
           ),
         ],
       ),
     ),
    );
  }
}
