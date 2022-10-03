import 'package:elibrary/utils/color_constant.dart';
import 'package:elibrary/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  final String text1;
  final String text2;
  final Function() onPressed;
  const ContainerUnder({
    Key? key,
    required this.text1,

    required this.onPressed,
    required this.text2,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode? Palette.googleColor:mFacebookColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text1,
              fontSize:20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underLine: TextDecoration.none),
          TextButton(
            onPressed: onPressed,
              child: Row(
            children: [
              TextUtils(
                  text: text2,
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  underLine: TextDecoration.none),
            ],
          ),
          ),
        ],
      ),
    );
  }
}
