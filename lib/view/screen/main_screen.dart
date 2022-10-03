
import 'package:badges/badges.dart';
import 'package:elibrary/logic/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/main_controller.dart';
import '../../routes/routes.dart';
import '../../utils/color_constant.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx((){
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              title: Text(controller.title[controller.currentIndex.value]),
              centerTitle: true,
              automaticallyImplyLeading: false,
              actions: [
                Obx(()
                  => Badge(
                    position: BadgePosition.topEnd(top: 0, end: 20),
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent:  Text(
                     cartController.quantity().toString(),
                      style: const TextStyle(color: Colors.white
                      ),
                    ),
                    child: IconButton(
                      onPressed: (){
                        Get.toNamed(Routes.cartScreen);
                        },
                      icon:Image.asset('assets/images/book.png',color: Colors.white,),
                    ),
                  ),
                ),

              ],
              elevation: 0.0,
              backgroundColor: Get.isDarkMode?darkGreyClr:mFacebookColor  ,
            ),

            bottomNavigationBar: BottomNavigationBar(
              elevation: 0.0,
              currentIndex: controller.currentIndex.value,

              backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,

              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode?Palette.googleColor:mFacebookColor,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode?Colors.white:Colors.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode?Palette.googleColor:mFacebookColor,
                  ),
                  icon: Icon(
                    Icons.category,
                    color: Get.isDarkMode?Colors.white:Colors.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode?Palette.googleColor:mFacebookColor,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode?Colors.white:Colors.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode?Palette.googleColor:mFacebookColor,
                  ),
                  icon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode?Colors.white:Colors.black,
                  ),
                  label: '',
                ),
              ],
              onTap: (index){
                controller.currentIndex.value = index;
              },

            ),

            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs.value,
            ),

          );
        },
        )
    );
  }
}

