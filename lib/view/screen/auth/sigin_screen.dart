import 'package:elibrary/logic/controllers/auth_controller.dart';
import 'package:elibrary/routes/routes.dart';
import 'package:elibrary/utils/color_constant.dart';
import 'package:elibrary/utils/my_string.dart';
import 'package:elibrary/view/widgets/auth/auth-text_from_filed.dart';
import 'package:elibrary/view/widgets/auth/auth_button.dart';
import 'package:elibrary/view/widgets/auth/check_widget.dart';
import 'package:elibrary/view/widgets/auth/container_under.dart';
import 'package:elibrary/view/widgets/text_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final controller = Get.find<AuthController>();


  final formKey = GlobalKey<FormState>();

  SingUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode? darkGreyClr: Colors.white,
          elevation: 0.0,

        ),
        backgroundColor: context.theme.backgroundColor,

        body: SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 40),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(

                      child: Column(

                        children: [
                          Row(
                            children: [
                              TextUtils(text: "SING",
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color: Get.isDarkMode?Palette.googleColor:mFacebookColor,
                                  underLine: TextDecoration.none),
                              const SizedBox(width: 3,),
                              TextUtils(text: "UP",
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color:Get.isDarkMode? Colors.white:Colors.black ,
                                  underLine: TextDecoration.none)
                            ],
                          ),
                          const SizedBox(height: 45.0,),
                          AuthTextFormFiled(
                            controller:nameController,
                            obscureText: false,
                            prefixIcon: Get.isDarkMode? Image.asset('assets/images/icons8-user-24.png'):
                            Icon(Icons.person,size: 30,color: mFacebookColor,),
                            suffixIcon: const Text(''),
                            validator: (value){
                              if(value.toString().length <=2 || !RegExp(validationName).hasMatch(value)){
                                return 'Enter Valid Name !';
                              }
                              else{
                                return null;
                              }
                            },
                            hintText: 'Enter UserName',
                            labelText: 'Name' ,
                            type: TextInputType.text,

                          ),
                          const SizedBox(height: 24,),
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
                          AuthTextFormFiled(
                            controller:phoneController,
                            obscureText: false,
                            prefixIcon:Get.isDarkMode? Image.asset('assets/images/icons8-lock-50.png'):
                            Icon(Icons.phone,size: 30,color: mFacebookColor,),
                            suffixIcon: Text(''),
                            validator: (value){
                              if(!RegExp(vallidationPhone).hasMatch(value)){
                                return 'Enter Valid Phone Number !';
                              }
                              else{
                                return null;
                              }
                            },
                            hintText: 'Enter PhoneNumber',
                            labelText: 'Phone' ,
                            type: TextInputType.number ,

                          ),
                          const SizedBox(height: 24,),
                         GetBuilder<AuthController>
                           (builder: (_){
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


                          const SizedBox(height: 50,),

                          CheckWidget(),
                          const SizedBox(height: 50,),
                         GetBuilder<AuthController>(builder: (_){
                           return  AuthButton(
                             onPressed: () {

                               if(controller.isCheckBox==false){
                                 Get.snackbar('Check Box',
                                     "Please Accept terms & conditions",
                                   snackPosition: SnackPosition.BOTTOM,
                                   backgroundColor: Colors.red,
                                   colorText: Colors.white,

                                 );
                               }

                               else if(formKey.currentState!.validate()){
                                 String name = nameController.text.trim();
                                 String email =emailController.text.trim();
                                 String password = passController.text;
                                 var phone = phoneController.text.trim();


                                 controller.singUpFirebase(
                                     name: name,
                                     email: email,
                                     phone: phone,
                                     password: password
                                 );

                                 controller.isCheckBox =true;
                               }

                             },
                             text: 'Sing UP',

                           );
                         }
                         ),



                        ],
                      ),
                    ),
                  ),

                ),
              ),
              SizedBox(height: 35,),
              ContainerUnder(
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
                text1: 'Already have an Account?',
                text2: 'LogIn',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
