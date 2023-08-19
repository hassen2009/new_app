import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:new_app/homepage/home_page.dart';
import '../homepage/authentification.dart';
import 'Registrepage.dart';
class welcomescreen extends StatefulWidget {
  const welcomescreen({Key? key}) : super(key: key);

  @override
  State<welcomescreen> createState() => _welcomescreenState();
}

class _welcomescreenState extends State<welcomescreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<Authprovider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(child: Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle_outlined,size: 90,color: Colors.deepPurpleAccent,),
            SizedBox(height: 20,),
            const Text("Inscription",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.black),),
            SizedBox(height: 10,),
            const Text("Registrer maintenant",style: TextStyle(fontSize: 20,color: Color(0xFF424242)),),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                backgroundColor: Colors.deepPurpleAccent[200],

              ),
                onPressed: ()async{
                if(ap.isSignedIn == true){
                  await ap.getDataFromSP().whenComplete(() => Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context)=>HomePge())
                  )
                  )
                  ;}
                else{Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context)=>Registrepage())
                );}
                }, child: Text("Commencer",style: TextStyle(color: Colors.white),)
            ),
        ],
      ),
      )),
    );
  }
}
