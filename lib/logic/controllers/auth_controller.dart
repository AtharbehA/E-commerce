 import 'package:elibrary/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController{
  bool isVisbilty = false;
  bool isCheckBox = false;
  var displayUserName = ''.obs;
  var displayUserPhoto=''.obs;
  var displayUserEmail = ''.obs;
  var googleSignIn = GoogleSignIn();

  FirebaseAuth auth = FirebaseAuth.instance;


  var isSignedIn = false;
  final GetStorage authBox=GetStorage();

  User ? get userProfile => auth.currentUser;


  @override
  void onInit() {
    // displayUserName.value =
    // (userProfile!=null ? userProfile!.displayName:" ")!;
    // displayUserPhoto.value =
    // (userProfile!=null ? userProfile!.photoURL:" ")!;
    // displayUserEmail.value =
    // (userProfile!=null ? userProfile!.email:" ")!;
    super.onInit();
  }


  void visbilty(){
    isVisbilty = !isVisbilty;
    update();

  }
  void checkBox(){
    isCheckBox=!isCheckBox;
    update();
  }

  void singUpFirebase({
    required String name,
    required String email,
    required var phone,
    required String password,})async{
    try {
      await auth
          .createUserWithEmailAndPassword(
          email: email,
          password: password,


      ).then((value) => {
        displayUserName.value = name,
        auth.currentUser!.updateDisplayName(name),
      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'),' ').capitalize!;
      String message ='';

      if (error.code == 'weak-password') {
        message = 'provided password is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message='Account already exists for that email.';
      } else{
        message = error.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );


    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }



  }


  void logInFirebase(
  {
  required String email,
    required String password,
  })async{
    try {
       await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value) => displayUserName.value= auth.currentUser!.displayName!);

       isSignedIn = true;
       authBox.write('auth',isSignedIn );

       update();
       Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'),' ').capitalize!;
      String message ='';
      if (error.code == 'user-not-found') {
        message = 'Account dose not exists for that $email.. Create your account by signing up.. ';

      } else if (error.code == 'wrong-password') {
        message = 'Invalid Password... Please try again! ';
      }else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );


    }catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void googleFirebase() async{
    try{
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value =googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authBox.write('auth',isSignedIn );

      update();

      Get.offNamed(Routes.mainScreen);
    }catch(error){
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

    }

  }
  void facebookFirebase(){}
  void resetPasswordFirebase(String email)async{
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'),' ').capitalize!;
      String message ='';
      if (error.code == 'user-not-found') {
        message = 'Account dose not exists for that $email.. Create your account by signing up.. ';

      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );


    }catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
  void singOutFirebase()async{

    try{

      await auth.signOut();
      await googleSignIn.signOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      displayUserEmail.value='';
      isSignedIn = false;
      authBox.remove('auth');
      update();

      Get.offNamed(Routes.welcomeScreen);


    }catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

  }





}