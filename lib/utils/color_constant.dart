import 'package:flutter/material.dart';
Color darkGreyClr = Color(0xFF121212);
Color mBackgroundColor = Color(0xFFFFFFFF);

Color mPrimaryColor = Color(0xFFB98068);

Color mPrimaryTextColor = Color(0xFF8C746A);

Color mSecondTextColor = Color(0xFFB98068);

Color mSecondColor = Color(0xFFC28E79);

Color mFacebookColor = Color(0xFF4277BC);

Color color1 = Color(0xff685959);
Color color2 = Color(0xffADA798);
Color color3 = Color(0xffA5947F);
Color color4 = Color(0xff738871);
Color color5 = Color(0xff6D454D);

Color mTitleTextColor = Color(0xFF2D140D);
const kBackgroundColor = Color(0xFF202020);
const kPrimaryColor = Color(0xFFFFBD73);
class Palette {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor1 = Color(0XFFA7BCC7);
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color(0xFFECF3F9);
}

const Color darkSetting = Color(0xff6132e4);
const Color accountSetting = Color(0xff73bc65);
const Color logOutSetting = Color(0xff5f95ef);
const Color notSetting = Color(0xffdf5862);
const Color languageSetting = Color(0xffCB256C);








class ThemeApp{

 static final light = ThemeData(
   primaryColor: Palette.googleColor,
   backgroundColor: Colors.white,
   brightness: Brightness.light
 );
  static final dark = ThemeData(
      primaryColor: mFacebookColor,
      backgroundColor: darkGreyClr,
      brightness: Brightness.dark
  );

}