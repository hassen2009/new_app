import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/homepage/authentification.dart';
import 'package:new_app/homepage/home_page.dart';
import 'package:new_app/homepage/models/userInformationScreen.dart';
import 'package:new_app/utils/utils.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  const OtpScreen({ super.key,required this.verificationId, required this.phoneNumber}) ;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  bool resend = false;
  int count = 30;
  final _firebaseAth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    decompte();
  }
  late Timer timer;
  void decompte(){
    timer = Timer.periodic(Duration(seconds: 1), (t) {
     if(count<1){
       timer.cancel();
       count=30;
       resend=true;
       setState(() {

       });
       return;
     } else{
      count--;
      if (this.mounted) {
        setState(() {

        });
      };}

    });
  }

  void onResendotpcode(){
    resend=false;
    setState(() {

    });
    final _firebaseAth = FirebaseAuth.instance;
       _firebaseAth.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential)async{
          await _firebaseAth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed:(error){
          throw Exception(error.message);
        },
        codeSent: ( verificationId,v){
          resend=false;
          decompte();
          setState(() {

          });
        },
        codeAutoRetrievalTimeout: (String verificationId){

        },

      );

  }

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<Authprovider>(context,listen : true).isLoading;
    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.only(left: 7),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(25),
          ),
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios,size: 20,),
          ),
        ),
      ),
        body: SafeArea(child: isLoading ==true?Center(child: CircularProgressIndicator(color: Colors.deepPurpleAccent,),):Center(
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Icon(Icons.verified,size: 120,color: Colors.deepPurpleAccent,),
    SizedBox(height: 20,),
    Text("Verification",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
    SizedBox(height: 10,),
    Text("Entrer le code de verification  ",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
    SizedBox(height: 20,),
    Pinput(
      keyboardType:TextInputType.phone,
      length: 6,
          showCursor: true,
          defaultPinTheme: PinTheme(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.deepPurpleAccent),
            ),
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
            )
          ),
      onCompleted: (value){
          setState(() {
            otpCode = value;
          });
      },
    ),
      const SizedBox(
          height: 25,
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent
              ),
              onPressed: (){
            if(otpCode!=null){
              verifyOtp(context,otpCode!);
            }else{
              showSnackBar(context, "Entrer 6-Digit code");
            }
          }, child: Text("Verifier",style: TextStyle(
            color: Colors.white
          ),)),

      ),
      const SizedBox(height: 20,),
      Text("Vous ne recevez aucun code ?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.white38:Colors.black38),),
      SizedBox(height: 20,),
      TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Get.isDarkMode?Colors.black:Colors.white
          ),
          onPressed: !resend?null: onResendotpcode, child: Text(!resend?"00:${count.toString().padLeft(3,"0")}":"Renvoyer",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.white:Colors.deepPurpleAccent),))
      ],)
          ),
          ),
        ),
        ));
  }
  Future<void> verifyOtp(BuildContext context, String userOtp) async{
    final ap = Provider.of<Authprovider>(context,listen : false);
     ap.verifyOpt(context: context, verificationId: widget.verificationId, userOtp: userOtp, onSuccess: (){
      ap.checkExistingUser().then((value)  async{
        if(value==true){
          await ap.getDataFromFireStore();
          await ap.saveUserDataToSP();
          await ap.setSignIn();
          if (!mounted) return;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePge()),
                  (route) => false);

;        }
        else{
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context)=>const UserInformationScreen()), (route) => false);}
      });
    });
  }
}
