import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes{
  TextStyle get subHeadingStyle{
    return GoogleFonts.lato(
     textStyle : TextStyle(
       fontSize: 24,
       fontWeight:  FontWeight.bold,
       color: Colors.black
     )
    );
  }
   static TextStyle get titlestyle{
    return GoogleFonts.lato(
        textStyle : TextStyle(
            fontSize: 16,
            fontWeight:  FontWeight.bold,
          color: Get.isDarkMode?Colors.white:Colors.black

        )
    );
  }


}