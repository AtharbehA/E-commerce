

import 'package:elibrary/logic/controllers/setting_controller.dart';
import 'package:elibrary/utils/color_constant.dart';
import 'package:elibrary/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/theme_controller.dart';

class DarkModeWidget extends StatelessWidget {

  final controller = Get.find<SettingController>();
   DarkModeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconWidget(),

        Switch(
            activeTrackColor:Get.isDarkMode?Palette.googleColor: mFacebookColor,
            activeColor:Get.isDarkMode?Palette.googleColor:mFacebookColor,
            value: controller.switchValue.value,
            onChanged: (value){
              ThemeController().changesTheme();
              controller.switchValue.value = value;
            }
        ),
      ],
    ),
    );
  }
}

Widget buildIconWidget(){
  return Material(
    color: Colors.transparent,
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: darkSetting,
          ),
          child: const Icon(
            Icons.dark_mode,
            color: Colors.white,
          ),
        ),

        const SizedBox(width: 20,),

         TextUtils(text: "Dark Mode",
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode?Colors.white:Colors.black,
            underLine: TextDecoration.none
        )

      ],
    ),
  );
}
