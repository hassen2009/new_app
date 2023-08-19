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
  const OtpScreen({ super.key,required this.verificationId}) ;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
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
          child: ElevatedButton(onPressed: (){
            if(otpCode!=null){
              verifyOtp(context,otpCode!);
            }else{
              showSnackBar(context, "Entrer 6-Digit code");
            }
          }, child: Text("Verifier")),

      ),
      const SizedBox(height: 20,),
      Text("don't receive any code ?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black38),),
      SizedBox(height: 20,),
      Text("Resend new code",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent),)
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
