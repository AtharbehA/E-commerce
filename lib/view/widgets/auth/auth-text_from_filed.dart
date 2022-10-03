import 'package:elibrary/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final String labelText;
  final TextInputType type;


  const AuthTextFormFiled({Key? key,
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.labelText,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Get.isDarkMode?Palette.googleColor:mFacebookColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
      child: TextFormField(

        controller: controller,
        obscureText: obscureText,
        cursorColor: Get.isDarkMode?Colors.black:Colors.white,
        keyboardType: type,
        validator: (value)=>validator(value),


        decoration: InputDecoration(

          fillColor: Colors.grey.shade200,
          prefixIcon:prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          labelText: labelText ,

          labelStyle: TextStyle(
            color: Get.isDarkMode?Colors.black:mFacebookColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: TextStyle(
            color: Colors.black45,
            fontSize: 16,
            fontWeight: FontWeight.w500,

          ),


          enabledBorder: OutlineInputBorder(

            borderSide:  BorderSide(
              color: Get.isDarkMode?Colors.red:mFacebookColor,

            ),

                borderRadius: BorderRadius.circular(27),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color: Get.isDarkMode?Colors.red:mFacebookColor
            ),
            borderRadius: BorderRadius.circular(27),
          ),

          errorBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color: Get.isDarkMode?Colors.red:mFacebookColor
            ),
            borderRadius: BorderRadius.circular(27),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color: Get.isDarkMode?Colors.red:mFacebookColor
            ),
            borderRadius: BorderRadius.circular(27),
          ),
        ),





      ),
    );
  }
}
