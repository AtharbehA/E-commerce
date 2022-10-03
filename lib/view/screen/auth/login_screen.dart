import 'package:elibrary/logic/controllers/auth_controller.dart';
import 'package:elibrary/routes/routes.dart';
import 'package:elibrary/utils/color_constant.dart';
import 'package:elibrary/utils/my_string.dart';
import 'package:elibrary/view/widgets/auth/auth-text_from_filed.dart';
import 'package:elibrary/view/widgets/auth/container_under.dart';
import 'package:elibrary/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth/auth_button.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final controller = Get.find<AuthController>();

  final formKey = GlobalKey<FormState>();

   LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,

        appBar: AppBar(
          backgroundColor: Get.isDarkMode? darkGreyClr: Colors.white,
          elevation: 0.0,

        ),
        body: SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(text: "Log",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode?Palette.googleColor:mFacebookColor,
                                underLine: TextDecoration.none),
                            SizedBox(width: 3,),
                            TextUtils(text: "In",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color:Get.isDarkMode? Colors.white:Colors.black ,
                                underLine: TextDecoration.none)
                          ],
                        ),
                        const SizedBox(height: 45.0,),

                        AuthTextFormFiled(
                          controller:emailController,
                          obscureText: false,
                          prefixIcon:Get.isDarkMode? Image.asset('assets/images/icons8-secured-letter-30.png'):
                          Icon(Icons.email,size: 30,color: mFacebookColor,),
                          suffixIcon: Text(''),
                          validator: (value){
                            if(!RegExp(validationEmail).hasMatch(value)){
                              return 'Enter Valid Email !';
                            }
                            else{
                              return null;
                            }
                          },
                          hintText: 'Enter Email',
                          labelText: 'Email' ,
                          type: TextInputType.text ,

                        ),
                        const SizedBox(height: 24,),
                        GetBuilder<AuthController>(builder: (_){
                          return  AuthTextFormFiled(
                            controller:passController,
                            obscureText: controller.isVisbilty?false:true,
                            prefixIcon:Get.isDarkMode? Image.asset('assets/images/icons8-lock-50.png'):
                            Icon(Icons.lock,size: 30,color: mFacebookColor,),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visbilty();
                                },
                                icon: controller.isVisbilty?
                                const Icon(Icons.visibility_off,color: Colors.black,):
                                const Icon(Icons.visibility,color: Colors.black,)
                            ),
                            validator: (value){
                              if(!RegExp('').hasMatch(value)){
                                return 'Enter Valid Password !';
                              }
                              else{
                                return null;
                              }
                            },
                            hintText: 'Enter Password',
                            labelText: 'Password',
                            type: TextInputType.text ,

                          );
                        },
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: (){
                                Get.toNamed(Routes.forgetPassword);
                              },
                              child: TextUtils(
                                text: 'Forgot Password!',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Get.isDarkMode? Colors.white:Colors.black,
                                underLine: TextDecoration.none,
                              ),
                          ),
                        ),



                        const SizedBox(height: 50,),
                        GetBuilder<AuthController>(builder: (_){
                        return AuthButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              String email = emailController.text.trim();
                              String password = passController.text;
                              controller.logInFirebase(
                                  email: email,
                                  password: password
                              );
                            }
                          },
                          text: 'LogIn',

                        );
                        }
                        ),
                        SizedBox(height: 20,),
                        TextUtils(
                            text: 'OR',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Get.isDarkMode? Colors.white:Colors.black,
                            underLine: TextDecoration.none,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<AuthController>(builder: (_){
                              return InkWell(
                                  onTap: (){
                                    controller.googleFirebase();
                                  },
                                  child: Image.asset
                                    ("assets/images/google.png",height: 35,width: 35,));
                            }
                            ),
                            SizedBox(width: 15,),
                            InkWell(
                              onTap:(){},
                                child: Image.asset
                                  ("assets/images/facebook.png",height: 35,width: 35,)),
                          ],
                        ),

                      ],
                    ),
                  ),

                ),
              ),
              SizedBox(height: 38,),
              ContainerUnder(
                onPressed: () {
                  Get.offNamed(Routes.singUpScreen);
                },
                text1: "Don't have Account?",
                text2: 'SingUp',
              ),

            ],
          ),
        ),
      ),
    );
  }
}
