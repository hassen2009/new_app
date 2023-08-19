import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../homepage/authentification.dart';
 class Registrepage extends StatefulWidget {
   const Registrepage({Key? key}) : super(key: key);

   @override
   State<Registrepage> createState() => _RegistrepageState();
 }

 class _RegistrepageState extends State<Registrepage> {
   Country country = Country(
   phoneCode: "222",
   countryCode: "MR",
   e164Sc: 0,
   geographic: true,
   level: 1,
   name: "Mauritania",
   example: "Mauritania",
   displayName: "Mauritania",
   displayNameNoCountryCode: "MR",
   e164Key: "");
   final TextEditingController registercontroller = TextEditingController() ;

   @override

   Widget build(BuildContext context) {
     registercontroller.selection = TextSelection.fromPosition(
       TextPosition(offset : registercontroller.text.length),
     );
     return Scaffold(
       resizeToAvoidBottomInset: false,
       body: SafeArea(child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
         child: Center(
           child: SingleChildScrollView(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 const Icon(Icons.verified_user_outlined,size: 120,color: Colors.deepPurpleAccent,),
                 const SizedBox(height: 20,),
                 const Text("Enregistrer",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                 const SizedBox(height: 10,),
                 const Text("Ajoutez votre numéro de téléphone, nous vous enverrons un code de vérification"),
                 const SizedBox(height: 20,),
                 TextFormField(
                   controller: registercontroller ,
                   style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                   onChanged:(value){setState(() {
                     registercontroller.text = value;
                   });},
                   decoration: InputDecoration(
                     hintText: "Entrer votre numero de telephone",
                     hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey.shade600),
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: const BorderSide(color: Colors.black38),

                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: const BorderSide(color: Colors.deepPurpleAccent,width: 3)
                     ),
                     prefixIcon: Container(
                       padding: const EdgeInsets.all(16),
                     child: InkWell(
                       onTap: (){
                         showCountryPicker(
                             context: context,
                             countryListTheme: const CountryListThemeData(bottomSheetHeight: 400),
                             onSelect: (value){
                               setState(() {
                                 country = value;
                               });
                             }
                         );
                       },
                       child: Text("${country.flagEmoji} + ${country.phoneCode}",
                       style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                     ),
                     ),
                     suffixIcon: registercontroller.text.length >7?Container(
                       height: 30,
                         width: 30,
                         margin: const EdgeInsets.all(10),
                       decoration: const BoxDecoration(
                         shape: BoxShape.circle,
                         color: Colors.deepPurpleAccent,
                       ),
                       child: const Icon(Icons.done,size: 20,color: Colors.white,),
                     ):null,
                   ),


                 ),
                 SizedBox(height: 20,),
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Get.isDarkMode?Colors.deepPurpleAccent[200]:Colors.deepPurpleAccent[200]
                   ),
                 child: const Text("Se connecter"),onPressed: ()=> sendPhoneNumber())

               ],
             ),
           ),
         ),
       )
       ),
     );

   }
   void sendPhoneNumber() async {
     final ap = Provider.of<Authprovider>(context, listen: false);
     String phoneNumber = registercontroller.text.trim();
     ap.signInWithPhone(context, "+ ${country.phoneCode}$phoneNumber");
   }
 }
