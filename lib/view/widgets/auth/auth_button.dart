import 'package:elibrary/utils/color_constant.dart';
import 'package:elibrary/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({Key? key,
     required this.text,
    required this.onPressed
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode? Palette.googleColor:mFacebookColor,
        onSurface: Colors.yellow,
        onPrimary: Colors.white,
        side: BorderSide(color: Get.isDarkMode? Palette.googleColor:mFacebookColor, width: 1),
        elevation: 15,
        shadowColor: Get.isDarkMode? Palette.googleColor:mFacebookColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),

        minimumSize: Size(300, 50),

      ),


        child: TextUtils(
          color: Colors.white,
          text: text,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          underLine: TextDecoration.none,
        ),


    );
  }
}
