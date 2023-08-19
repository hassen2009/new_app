import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/empl/theme.dart';
import 'package:new_app/barpages/themess.dart';

class Myinputfield extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
   Myinputfield({Key? key,
    required this.title,
    required this.hint,
    this.controller,
     this.widget,

  }) : super(key: key);

  @override
  State<Myinputfield> createState() => _MyinputfieldState();
}

class _MyinputfieldState extends State<Myinputfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 9),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(widget.title,style: GoogleFonts.lato(
           textStyle: TextStyle(
               fontSize: 16,
               fontWeight:  FontWeight.bold,
           )
         ) ),
         Container(
           height: 52,
           margin: EdgeInsets.only(top: 8),
           padding: EdgeInsets.only(left: 14),
           decoration: BoxDecoration(
             border: Border.all(
               color: Theme.of(context).colorScheme.secondary,
               width: 1
             ),
             borderRadius: BorderRadius.circular(10),
           ),
           child: Row(
             children: [
               Expanded(
                   child: TextField(
                     readOnly: widget.widget==null?false:true,
                     autofocus: false,
                     cursorColor:  Colors.grey[600],
                     controller: widget.controller,
                     style: GoogleFonts.lato(
                       textStyle: TextStyle(
                         fontSize: 14,
                         fontWeight: FontWeight.bold,
                         color:
                         Colors.grey[600]
                       )
                     ),
                     decoration: InputDecoration(
                       hintText: widget.hint,
                       border: InputBorder.none,
                       hintStyle: GoogleFonts.lato(
                           textStyle: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.bold,
                               color: Get.isDarkMode?Colors.grey[600]:Colors.grey[600]
                           )
                       ),
                       focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.white,
                           width: 0,
                         ),
                       ),
                     ),
                   )
               ),
               widget.widget==null?Container():Container(child:widget.widget)
             ],
           ),
         )
       ],
     ),
    );
  }
}
