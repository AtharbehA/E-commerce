import 'package:elibrary/logic/controllers/auth_controller.dart';
import 'package:elibrary/utils/color_constant.dart';
import 'package:elibrary/utils/my_string.dart';
import 'package:elibrary/view/widgets/auth/auth-text_from_filed.dart';
import 'package:elibrary/view/widgets/auth/auth_button.dart';
import 'package:elibrary/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController forgotController = TextEditingController();
  final controller = Get.find<AuthController>();
  ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(

          appBar: AppBar(
            backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title:  Text('Forgot Password',
            style: TextStyle(
              color: Get.isDarkMode?Palette.googleColor:mFacebookColor,
            ),
            ),
            leading: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(Icons.arrow_back,
                color:Get.isDarkMode?Palette.googleColor:mFacebookColor ,
              ),
            ),
          ),
          backgroundColor: context.theme.backgroundColor,


          body: Form(
            key: formKey,
            child:  SingleChildScrollView(
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: (){
                          Get.back();
                        },
                        icon: Icon(Icons.close_rounded,
                          color:Get.isDarkMode?Colors.white:Colors.black ,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextUtils(
                        text: 'If you to recover your account, then please provide your email ID below..',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        underLine: TextDecoration.none
                    ),
                    SizedBox(height: 50,),
                    Image.asset('assets/images/spot-34.png',
                    width: 270,
                    ),
                    const SizedBox(height: 50,),
                    AuthTextFormFiled(
                      controller:forgotController,
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

                    const SizedBox(height: 50,),
                    GetBuilder<AuthController>(builder: (_){
                      return AuthButton(
                          text: 'SEND',
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              controller.resetPasswordFirebase(forgotController.text.trim());
                            }
                          }
                      );
                    })
                  ],
                ),

              ),
            ),
          ),
        ),
    );
  }
}
