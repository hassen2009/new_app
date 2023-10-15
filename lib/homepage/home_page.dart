import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_app/barpages/welcomescreen.dart';
import 'package:new_app/homepage/authentification.dart';
import 'package:new_app/homepage/models/notifications.dart';
import 'package:new_app/homepage/stry.dart';
import 'package:provider/provider.dart';
import '../empl/services.dart';
import '../barpages/rattrapage.dart';
import '../barpages/emploi.dart';
import 'header_page.dart';
import 'package:new_app/homepage/SearchSection.dart';
import 'CatagorySection.dart';
class HomePge extends StatefulWidget {
  const HomePge({Key? key}) : super(key: key);

  @override
  State<HomePge> createState() => _HomePgeState();
}

class _HomePgeState extends State<HomePge> {
  var notifyHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }
  int _currentIndex = 0;
  setCurrentIndex(int index){
    setState(() {
      _currentIndex =index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        flexibleSpace: ClipRect(child: BackdropFilter(filter: ImageFilter.blur(sigmaY: 25,sigmaX: 25,),
        child: Container(
          color: Get.isDarkMode?Colors.black:Colors.transparent,
        ),
        ),),
        elevation: 0,
        backgroundColor: Get.isDarkMode?Colors.black.withAlpha(2000):Colors.white.withAlpha(2000),
       actions: [
         GestureDetector(
           onTap: (){
             setState(() {
               themeservices().SwitchTheme();
             });
           },
           child: Padding(
             padding: const EdgeInsets.only(right: 20),
             child: Icon(Get.isDarkMode?Icons.wb_sunny_outlined:Icons.nightlight_round,
             ),
           ) ,
         ),

       ],
      ),
      drawer: const MyDrawer(),
      body:
      [
      SingleChildScrollView(
      child: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(),
    Container(height: 4,color: Get.isDarkMode?Colors.grey[900]:Colors.grey[300],),
    stry(),
          Container(height: 4,color: Get.isDarkMode?Colors.grey[900]:Colors.grey[300],),
    CatagorySection(),
    ],
    ),
    ],
    )),
        emploi(),
        conference(),
      ][_currentIndex],
      bottomNavigationBar: NavigationBar(),
    );
  }

  NavigationBar() {
    return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: BottomNavigationBar(
              backgroundColor: Get.isDarkMode?Colors.black.withAlpha(1000):Colors.white.withAlpha(1000),
              currentIndex: _currentIndex,
              onTap: (index) => setCurrentIndex(index),
              elevation: 0,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              unselectedItemColor: Get.isDarkMode?Colors.grey[300]:Colors.grey[800],
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  label: "Accueil",
                  icon: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Icon(_currentIndex==0?
                    Icons.home:Icons.home_outlined,
                      size: 30,
                    ),
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
                    child:  Icon(_currentIndex==1?
                    Icons.task:Icons.task_outlined,
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
                      _currentIndex==2?
                      Icons.assignment:Icons.assignment_outlined,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class MyDrawer  extends StatelessWidget {
const  MyDrawer ({super.key});
 @override
  Widget build(BuildContext context){
   final ap = Provider.of<Authprovider>(context,listen:false);
   return Drawer(
   backgroundColor: Get.isDarkMode?CupertinoColors.darkBackgroundGray:Colors.white,
     child: SingleChildScrollView(
         child: Column(
           children: [
             DrawerHeader(
               child: CircleAvatar(
               backgroundColor: Colors.deepPurpleAccent,
               backgroundImage: NetworkImage(ap.userModel.profilePic),
               radius: 50,
             ),),

             Padding(
               padding: const EdgeInsets.only(right: 8.0,left: 8.0,bottom: 10),
               child: Text(ap.userModel.name,style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.w600,
                 color: Get.isDarkMode?Colors.white:Colors.black,
               ),textAlign: TextAlign.center,),
             ),
             Text(ap.userModel.bio,style: TextStyle(
               fontSize: 18,
               color: Get.isDarkMode?Colors.white:Colors.black,
             ),),
            Mylisttile(icon: Icons.logout_sharp, text: "Déconnexion", onTap: ()async { await ap.userSignOut().then((value) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>welcomescreen()), (route) => false)); },),
           ],
         )),
   );
}

}

class Mylisttile extends StatelessWidget{
  final IconData icon;
  final String text;
  final void Function()? onTap;
 const Mylisttile({super.key,
    required this.icon,
    required this.text,
   required this.onTap
  });

  @override
  Widget build(BuildContext context) {
   return Padding(padding: EdgeInsets.all(10),child:
     ListTile(
       leading: Icon(
         icon,
         color: Get.isDarkMode?Colors.white:Colors.black,
         size: 26,
       ),
       onTap: onTap,
       title: Text(
         text,
         style: TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontSize: 20,fontWeight: FontWeight.w500,)
       ),
     )
     ,);

  }

}
