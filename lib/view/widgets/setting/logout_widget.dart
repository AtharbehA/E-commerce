import 'package:elibrary/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../text_utils.dart';

class LogoutWidget extends StatelessWidget {
   LogoutWidget({Key? key}) : super(key: key);


  final  controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_)=>
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
                Get.defaultDialog(
                  title: 'LogOut From App',
                  titleStyle: const TextStyle(
                    fontSize:18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  middleText: 'Are you sure you need to logout',
                  middleTextStyle: const TextStyle(
                    fontSize:18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.grey,
                  radius: 20,
                  textCancel: 'No',
                  cancelTextColor: Colors.white,
                  textConfirm: 'Yes',
                  confirmTextColor: Colors.white,
                  onCancel: (){
                    Get.offNamed(Routes.mainScreen);
                  },
                  onConfirm: (){
                    controller.singOutFirebase();
                  },
                  buttonColor: Get.isDarkMode?Palette.googleColor:mFacebookColor,
                );



            },
            splashColor: Get.isDarkMode?Colors.red:Colors.blue[100],

            borderRadius: BorderRadius.circular(12),
            customBorder: const StadiumBorder(),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: logOutSetting,
                  ),
                  child: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(width: 20,),

                TextUtils(text: "LogOut",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode?Colors.white:Colors.black,
                    underLine: TextDecoration.none
                )

              ],
            ),
          ),
        ),
    );
  }
}
