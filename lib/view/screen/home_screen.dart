import 'package:elibrary/utils/color_constant.dart';
import 'package:elibrary/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../widgets/home/card_item.dart';
import '../widgets/home/srarch_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Get.isDarkMode?darkGreyClr:mFacebookColor,
                  borderRadius:const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const TextUtils(
                          text: 'Find Your',
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          underLine: TextDecoration.none
                      ),
                      const SizedBox(height: 4,),
                      const TextUtils(
                          text: 'BOOK',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Palette.googleColor,
                          underLine: TextDecoration.underline
                      ),
                      const SizedBox(height: 20,),
                      SearchFormText(),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextUtils(
                      text: 'Categories',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Get.isDarkMode? Colors.white : Colors.black,
                      underLine: TextDecoration.none
                  ),
                ),
              ),

              const SizedBox(height: 20,),

               CardItem(),

            ],
          ),

    )
    );
  }
}
