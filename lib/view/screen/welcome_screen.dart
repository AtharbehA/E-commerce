import 'package:elibrary/routes/routes.dart';
import 'package:elibrary/utils/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset('assets/images/library.jpg',
              fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60.0,
                    width: 190.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Center(
                      child:TextUtils(
                        text: 'Welcome',
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white,
                        underLine: TextDecoration.none,

                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60.0,
                    width: 230.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          text: 'E-',
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color:Palette.googleColor,
                          underLine: TextDecoration.none,

                        ),
                        TextUtils(
                          text: 'Library',
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color:Colors.white,
                          underLine: TextDecoration.none,

                        ),
                      ],
                    )
                  ),
                  SizedBox(height: 250,),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Palette.googleColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50,vertical: 12),
                    ),
                      onPressed: (){

                      Get.toNamed(Routes.loginScreen);
                      },
                      child: TextUtils(
                        color: Colors.white,
                        fontSize: 20, text: 'Get Start',
                        fontWeight: FontWeight.bold,
                        underLine: TextDecoration.none,

                      ),

                  ),

                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          text: 'Dont Have Account?',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          underLine: TextDecoration.none,),
                      TextButton(
                          onPressed: (){
                            Get.toNamed(Routes.singUpScreen);
                          },
                          child: TextUtils(
                              text: 'SingUp',
                              fontSize: 18,

                              color: Palette.googleColor,
                            underLine: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),

                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
