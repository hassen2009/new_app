import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:new_app/homepage/models/opt_Screen.dart';
import 'package:new_app/utils/utils.dart';

import 'models/adminpannel.dart';

class Authprovider extends ChangeNotifier {
  final _firebaseFireStore = FirebaseFirestore.instance;
  final _firebaseStorage = FirebaseStorage.instance;
 bool _isSignedIn = false;
 bool get isSignedIn => _isSignedIn;
 bool _isLoading = false;
 bool get isLoading => _isLoading;
 String ? _uid;
 String get uid  => _uid!;
  UserModel? _userModel;
  UserModel get userModel  => _userModel!;
 final FirebaseAuth _firebaseAth = FirebaseAuth.instance;

 Authprovider(){
  
   checkSignIn();
 }
  void checkSignIn() async {
  final SharedPreferences s = await SharedPreferences.getInstance();
  _isSignedIn = s.getBool("is_signedin")??false;
  notifyListeners();
  }
  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
     s.setBool("is_signedin", true);
    _isSignedIn = true;
    notifyListeners();
 }
  void signInWithPhone(BuildContext context,String phoneNumber) async {
  try { await _firebaseAth.verifyPhoneNumber(
   phoneNumber: phoneNumber,
      timeout: Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential)async{
       await _firebaseAth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed:(error){
       throw Exception(error.message);
      },
      codeSent: (String verificationId,int? forceResendingToken){
         Get.to(OtpScreen(verificationId: verificationId, phoneNumber:phoneNumber,),);
      },
      codeAutoRetrievalTimeout: (String verificationId){

      },

  );} on  FirebaseAuthException catch(e){
   showSnackBar(context, e.message.toString());
  }
  }
   void verifyOpt({
   required BuildContext context,
     required String verificationId,
     required String userOtp,
     required Function onSuccess,

}) async {
   _isLoading= true;
  notifyListeners();
  try{
    PhoneAuthCredential creds = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: userOtp);
    User? user =  (await _firebaseAth.signInWithCredential(creds)).user!;
    if(user!= null){
      _uid = user.uid;
    onSuccess();
    }
  }
  on FirebaseAuthException catch(e) {
    showSnackBar(context, e.message.toString());
     _isLoading = false;
     notifyListeners();
  }

   }
 Future<bool> checkExistingUser() async {
 DocumentSnapshot snapshot = await _firebaseFireStore.collection("users").doc(_uid).get();
 if(snapshot.exists){
   print("USER EXIST");
   return true;
 }else{
   print("NEW USER");
   return false;
 }

 }
 void saveUserDataToFirebase({required BuildContext context,required UserModel userModel,required File profilePic,required Function onSuccess})async{
   _isLoading = true;
   notifyListeners();
   try{
     await storeFileToStorage("profilePic/$_uid", profilePic).then((value) {
       userModel.profilePic = value;
       userModel.createdAt = DateTime.now().microsecondsSinceEpoch.toString();
       userModel.phoneNumber = _firebaseAth.currentUser!.phoneNumber!;
       userModel.uid =_firebaseAth.currentUser!.phoneNumber!;
     });
     _userModel = userModel;
     await _firebaseFireStore.collection("users").doc(_uid).set(userModel.toMap()).then((value){
       onSuccess();
         _isLoading = false;
         notifyListeners();
     });
   } on FirebaseAuthException catch (e) {
     showSnackBar(context, e.message.toString());
     _isLoading = false;
     notifyListeners();
   }
 }
Future<String> storeFileToStorage(String ref,File file)async {
   UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
   String downloadUrl = await (await uploadTask).ref.getDownloadURL();
   return downloadUrl;
 }
 Future getDataFromFireStore()async{
   await _firebaseFireStore.collection("users").doc(_firebaseAth.currentUser!.uid).get().then((DocumentSnapshot snapshot){
     _userModel = UserModel(
         name:snapshot["name"],
         bio: snapshot["bio"],
         profilePic: snapshot["profilePic"],
         createdAt: snapshot["createdAt"],
         phoneNumber: snapshot["phoneNumber"],
         uid: snapshot["uid"],
         role: snapshot["role"],
         role2: snapshot["role2"],
         typel: snapshot["typel"]
     );

     _uid = userModel.uid;
   });
 }
 Future saveUserDataToSP()async{
   SharedPreferences s = await SharedPreferences.getInstance();
   await s.setString("user_model", jsonEncode(userModel.toMap()));
 }
 Future getDataFromSP()async{
   SharedPreferences s = await SharedPreferences.getInstance();
   String data = s.getString("user_model")??'';
   _userModel = UserModel.fromMap(jsonDecode(data));
   _uid=_userModel!.uid;
   notifyListeners();
 }
 Future userSignOut() async {
   SharedPreferences s = await SharedPreferences.getInstance();
  await _firebaseAth.signOut();
  _isSignedIn = false;
  notifyListeners();
  s.clear();
 }

}

