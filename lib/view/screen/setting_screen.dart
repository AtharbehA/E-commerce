// ignore_for_file: camel_case_types

import 'package:elibrary/logic/controllers/auth_controller.dart';
import 'package:elibrary/logic/controllers/theme_controller.dart';
import 'package:elibrary/routes/routes.dart';
import 'package:elibrary/utils/color_constant.dart';
import 'package:elibrary/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/setting/dark_mode_widget.dart';
import '../widgets/setting/logout_widget.dart';
import '../widgets/setting/profile_image_widget.dart';

class settingScreen  extends StatelessWidget {
  const settingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),

        children: [
          ProfileImage(),
          const SizedBox(height: 10,),
          Divider(
            color: Get.isDarkMode?Colors.white:Colors.grey,
            thickness: 2,
            
          ),
          const SizedBox(height: 20,),
          TextUtils(
              text: "GENERAL",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?Palette.googleColor:mFacebookColor,
              underLine: TextDecoration.none,
          ),

          const SizedBox(height: 20,),
          DarkModeWidget(),
          const SizedBox(height: 20,),
          //LanguageWidget(),
          const SizedBox(height: 20,),
          LogoutWidget(),

        ],
      ),


    );
  }
}
