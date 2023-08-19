import 'package:flutter/material.dart';

 class empbtn extends StatelessWidget {
   final label;
   final Function()? ontap;
   const empbtn({Key? key,required this.label,required this.ontap}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: ontap,
       child: Container(
        margin: EdgeInsets.symmetric(horizontal: 23,vertical: 0),
         width: 88,
           height: 50,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           color: Colors.deepPurpleAccent
         ),
         child: Center(
           child: Text(
             label,
             style: TextStyle(
               color: Colors.white,
             ),
           ),
         ),
       ),
     );
   }
 }

