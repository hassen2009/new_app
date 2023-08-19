import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_app/homepage/authentification.dart';
import 'package:new_app/homepage/home_page.dart';
import 'package:new_app/model/usermodel.dart';
import 'package:new_app/utils/utils.dart';
import 'package:provider/provider.dart';
class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
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
                        hintText: "Entrer votre nom",
                        icon: Icons.account_circle,
                        inputType: TextInputType.name,
                        maxLines: 1,
                        controller:nameController
                    ),
                        textField(
                            hintText: "Ajouter une bio",
                            icon: Icons.edit,
                            inputType: TextInputType.name,
                            maxLines: 1,
                            controller:bioController
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 50,
                            width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            child: Text("Continue"),
                            onPressed: () =>storeData(),
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
        uid: "");
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
