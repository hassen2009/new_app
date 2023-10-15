import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/homepage/authentification.dart';
import 'package:new_app/homepage/home_page.dart';
import 'package:new_app/model/usermodel.dart';
import 'package:new_app/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../empl/imput2.dart';
import '../../empl/inputfields.dart';
class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  String _selectedrepeat = "L2";
  List<String> repeatlist = [
    "L2",
    "L3",
    "Autre chose"
  ];
  File? image;
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    bioController.dispose();
  }
  void selectImage()async{
    image = await pickImage(context);
    setState(() {

    });
  }
  @override

  Widget build(BuildContext context) {
    final isLoading = Provider.of<Authprovider>(context,listen : true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15,),
          child: isLoading == false ?Center(child: CircularProgressIndicator(color: Colors.deepPurpleAccent,),):Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: ()=>selectImage(),
                    child: image==null?const CircleAvatar(backgroundColor: Colors.deepPurpleAccent,
                    radius: 50, 
                        child: Icon(Icons.account_circle,color: Colors.white,size: 50,),
                    ):CircleAvatar(
                     backgroundImage: FileImage(image!),
                      radius: 50,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        textField(
                        hintText: "Entrez votre nom",
                        icon: Icons.account_circle,
                        inputType: TextInputType.name,
                        maxLines: 1,
                        controller:nameController,
                    ),
                        textField(
                            hintText: "Matricule",
                            icon: Icons.edit,
                            inputType: TextInputType.name,
                            maxLines: 1,
                            controller:bioController
                        ),
                        Myinputfielduser(
                          hint: "$_selectedrepeat",
                          widget: DropdownButton(
                            icon: Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                            iconSize: 32,
                            elevation: 4,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey[600],

                              ),
                            ),
                            underline: Container(height: 0,),
                            onChanged: (String? newValue){
                              setState(() {
                                _selectedrepeat = newValue!;
                              });
                            },
                            items: repeatlist.map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                value : value,
                                child: Text(value,style: TextStyle(color: Colors.grey)),
                              );
                            }).toList(),


                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 50,
                            width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Get.isDarkMode?Colors.deepPurpleAccent:Colors.deepPurpleAccent
                            ),
                            child: Text("Continue",style: TextStyle(color: Colors.white)),
                            onPressed: () => storeData()
                              ,
                          ),
                        )
                      ],
                    ),

                  )
                ],
              ),
            ),
          ),
        ),

      ),
    );

  }
  Widget textField({required String hintText,required IconData icon,required TextInputType inputType,required int maxLines,required TextEditingController controller}){
 return Padding(
     padding: EdgeInsets.only(bottom: 15),
   child: TextFormField(
     cursorColor: Colors.deepPurpleAccent,
       controller: controller,
     keyboardType: inputType,
     maxLines: maxLines,
     decoration: InputDecoration(
       prefixIcon: Container(
         margin: EdgeInsets.all(8),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(8),
             color: Colors.deepPurpleAccent
         ),
         child: Icon(icon,size: 20,color: Colors.white,),
       ),
       enabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(color: Colors.transparent)
       ),
       hintText: hintText,
       alignLabelWithHint: true,
       border: InputBorder.none,
       fillColor: Colors.deepPurple.shade50,
       filled: true

     ),
   ),
 );
  }
  void storeData()async{
    final ap = Provider.of<Authprovider>(context,listen: false);
    UserModel userModel = UserModel(
        name: nameController.text.trim(),
        bio: bioController.text.trim(),
        profilePic: "",
        createdAt: "",
        phoneNumber:"",
        uid: "",
        role: "",
        role2: "",
      typel: _selectedrepeat
    );
    if(image!=null&&nameController.text.isNotEmpty&&bioController.text.isNotEmpty){
       ap.saveUserDataToFirebase(
          context: context,
          userModel: userModel,
          profilePic: image!,
          onSuccess: (){
             ap.saveUserDataToSP().then(
                  (value) async {
                    await ap.setSignIn();
                    Get.to(()=>const HomePge());
                  }
            );
          }
      )
       ;
    }
    else{showSnackBar(context, "Ajouter votre profile image ");}
  }

}
