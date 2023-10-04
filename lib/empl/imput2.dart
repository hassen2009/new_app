import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/empl/theme.dart';
import 'package:new_app/barpages/themess.dart';

class Myinputfielduser extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  Myinputfielduser({Key? key,
    required this.hint,
    this.controller,
    this.widget,

  }) : super(key: key);

  @override
  State<Myinputfielduser> createState() => _MyinputfielduserState();
}

class _MyinputfielduserState extends State<Myinputfielduser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            
            height: 52,
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepPurpleAccent.withOpacity(0.15)
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
                        filled: false,
                        fillColor: Colors.deepPurpleAccent.withOpacity(0.2),
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
