import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:new_app/homepage/home_page.dart';
import 'package:new_app/barpages/rattrapage.dart';
import 'package:new_app/barpages/emploi.dart';
import '../Db/dbhelper.dart';
import '../empl/services.dart';
import '../barpages/themess.dart';
import 'package:new_app/main.dart';

class pges extends StatefulWidget {
  const pges({Key? key}) : super(key: key);

  @override
  State<pges> createState() => _pgesState();
}

class _pgesState extends State<pges> {
  int _currentIndex = 0;
  setCurrentIndex(int index){
    setState(() {
      _currentIndex =index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

      ],
      supportedLocales: [
        Locale('fr','FR'),
        Locale('en','EN'),
        Locale('ar','AR')
      ],
      debugShowCheckedModeBanner: false,
      theme: Hmode.lightTheme,
      darkTheme: Hmode.darkTheme,
      themeMode: themeservices().theme,
      home: Scaffold(
        body: [
          HomePge(),
          emploi(),
          conference(),
        ][_currentIndex],
        bottomNavigationBar: NavigationBar(),

      ),
    );
  }
   NavigationBar() {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 3),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setCurrentIndex(index),
            elevation: 10,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedItemColor: Colors.grey.withOpacity(0.7),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                label: "Accueil",
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: "Emploi",
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Icon(
                    Icons.library_books,
                    size: 25,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "A rattraper",
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Icon(
                    Icons.pages_rounded,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
