import 'package:elibrary/logic/controllers/auth_controller.dart';
import 'package:elibrary/utils/color_constant.dart';
import 'package:elibrary/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
       return Row(
        children: [
          InkWell(
            onTap: (){
              controller.checkBox();
            },
            child: Container(

              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),


              ),
              child: controller.isCheckBox?
              Get.isDarkMode?Image.asset('assets/images/icons8-done-50 (1).png')
                  :Icon(Icons.done,size: 30,color: mFacebookColor,)
                  :Container(),


            ),
          ),
          const SizedBox(width: 10,),
          Row(
            children:  [
              TextUtils(
                  text: 'I accept ',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode? Colors.black:Colors.white,
                  underLine: TextDecoration.none
              ),
              TextUtils(
                  text: 'terms & conditions',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode? Palette.googleColor:mFacebookColor,
                  underLine: TextDecoration.underline
              ),
            ],
          )
        ],
      );
    },

    );
  }
}
