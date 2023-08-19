import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_app/barpages/welcomescreen.dart';
import 'package:new_app/homepage/authentification.dart';
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
      appBar: AppBar(
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
      drawer: MyDrawer(),
      body:
      [
      SingleChildScrollView(
      child: Stack(
      children: [
        Column(
        children: [
        const HeaderSection(),
    const SearchSection(),
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
    return Container(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius:5,
                blurRadius: 0),
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
                icon: Icon(_currentIndex==0?
                Icons.home_filled:Icons.home_filled,
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
                  child:  Icon(_currentIndex==1?
                  Icons.table_rows_rounded:Icons.table_rows_outlined,
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
   backgroundColor: Get.isDarkMode?Colors.grey[900]:Colors.grey[300],
     child: SingleChildScrollView(

         child: Column(
           children: [
             DrawerHeader(child: CircleAvatar(
               backgroundColor: Colors.deepPurpleAccent,
               backgroundImage: NetworkImage(ap.userModel.profilePic),
               radius: 50,
             ),),

             Text(ap.userModel.name,style: TextStyle(
               fontSize: 28,
               fontWeight: FontWeight.w600,
               color: Get.isDarkMode?Colors.white:Colors.black,
             ),),
             Text(ap.userModel.bio,style: TextStyle(
               fontSize: 18,
               color: Get.isDarkMode?Colors.white:Colors.black,
             ),),
            Mylisttile(icon: Icons.logout_sharp, text: "Déconnexion", onTap: ()async { await ap.userSignOut().then((value) => Get.to(()=>welcomescreen())); },),
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
