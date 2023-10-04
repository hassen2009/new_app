import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Hmode{
  static ThemeData lightTheme = ThemeData(
   textButtonTheme: TextButtonThemeData(
     style: ButtonStyle(
       foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
       backgroundColor: MaterialStateColor.resolveWith((states) => Colors.orange),
       overlayColor: MaterialStateColor.resolveWith((states) => Colors.deepOrange),
     ),
   ),
    timePickerTheme: TimePickerThemeData(
    backgroundColor: Colors.blueGrey,
    hourMinuteShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Colors.orange, width: 4),
    ),
    dayPeriodBorderSide: const BorderSide(color: Colors.orange, width: 4),
    dayPeriodColor: Colors.blueGrey.shade600,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Colors.orange, width: 4),
    ),
    dayPeriodTextColor: Colors.white,
    dayPeriodShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Colors.orange, width: 4),
    ),
    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
    states.contains(MaterialState.selected) ? Colors.orange : Colors.blueGrey.shade800),
    hourMinuteTextColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.selected) ? Colors.white : Colors.orange),
    dialHandColor: Colors.blueGrey.shade700,
    dialBackgroundColor: Colors.blueGrey.shade800,
    hourMinuteTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    dayPeriodTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    helpTextStyle:
    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(0),
    ),
    dialTextColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.selected) ? Colors.orange : Colors.white),
    entryModeIconColor: Colors.orange,
  ),
    brightness: Brightness.light,
      appBarTheme: AppBarTheme(

          backgroundColor:   Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 18),
          iconTheme: IconThemeData(color: Colors.black,),
      ),
      colorScheme: ColorScheme.light(
          background: Colors.white,
        outline: Colors.blueAccent,
          primary: Colors.grey[300]!,
          secondary: Colors.black54,
          tertiary: Colors.black,
      ),
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
    datePickerTheme: DatePickerThemeData(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: Colors.black,backgroundColor: Colors.white,),
    iconTheme: IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: Colors.white,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white,),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      minimumSize: Size(400, 50),
      textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.normal)
    )),

  );
  static ThemeData darkTheme = ThemeData(
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.blueGrey,
      hourMinuteShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.orange, width: 4),
      ),
      dayPeriodBorderSide: const BorderSide(color: Colors.orange, width: 4),
      dayPeriodColor: Colors.blueGrey.shade600,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.orange, width: 4),
      ),
      dayPeriodTextColor: Colors.white,
      dayPeriodShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.orange, width: 4),
      ),
      hourMinuteColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected) ? Colors.orange : Colors.blueGrey.shade800),
      hourMinuteTextColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected) ? Colors.white : Colors.orange),
      dialHandColor: Colors.blueGrey.shade700,
      dialBackgroundColor: Colors.blueGrey.shade800,
      hourMinuteTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      dayPeriodTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      helpTextStyle:
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(0),
      ),
      dialTextColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected) ? Colors.orange : Colors.white),
      entryModeIconColor: Colors.orange,
    ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.orange),
          overlayColor: MaterialStateColor.resolveWith((states) => Colors.deepOrange),
        ),
      ),
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        backgroundColor:   Colors.black,
        elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 18),
        iconTheme: IconThemeData(color: Colors.white)
      ),
      colorScheme: ColorScheme.dark(
          background: Colors.black,
          outline: Colors.blueAccent,
          primary: Colors.grey[900]!,
          secondary: Colors.white54,
          tertiary: Colors.white,

      ),
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: Colors.white,backgroundColor: Colors.black),
      iconTheme: IconThemeData(color: Colors.white),
      scaffoldBackgroundColor: Colors.black,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.grey,),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
      minimumSize: Size(400, 50),
    textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.normal)
  )),
  );

}