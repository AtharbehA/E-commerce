import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration underLine;


  const TextUtils({Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.underLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.robotoMono(

        textStyle: TextStyle(
          decoration: underLine,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      )
    );
  }
}
