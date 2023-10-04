import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/barpages/welcomescreen.dart';
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
       appBar: AppBar(leading: IconButton(onPressed: (){Get.to(()=>welcomescreen());}, icon: Icon(Icons.arrow_back_ios)),),
       body: SafeArea(child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
         child: Center(
           child: SingleChildScrollView(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 const Icon(Icons.perm_contact_cal_outlined,size: 120,color: Colors.deepPurpleAccent,),
                 const SizedBox(height: 15,),
                 const SizedBox(height: 20,),
                 const Text("Un message de vérification sera envoyé à votre numéro de téléphone"
                 ,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14),textAlign: TextAlign.center,),
                 const SizedBox(height: 30,),
                 TextFormField(
                   keyboardType: TextInputType.phone,
                   controller: registercontroller ,
                   style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                   onChanged:(value){setState(() {
                     registercontroller.text = value;
                   });},
                   decoration: InputDecoration(
                     hintText: "Entrez votre numéro de téléphone",
                     hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey.shade600),
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide:  BorderSide(color: Get.isDarkMode?Colors.white30:Colors.black38),

                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: const BorderSide(color: Colors.deepPurpleAccent,width: 1)
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
                       child: Text("+ ${country.phoneCode}  |",
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
                 child: const Text("Se connecter",style: TextStyle(
                   fontSize: 16,fontWeight: FontWeight.normal,color: Colors.white
                 ),),onPressed: ()=>sendPhoneNumber())
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
