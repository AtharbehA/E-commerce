


import 'package:elibrary/logic/binding/main_binding.dart';
import 'package:elibrary/logic/binding/product_binfing.dart';
import 'package:elibrary/logic/controllers/product_controller.dart';
import 'package:elibrary/view/screen/auth/forget_password.dart';
import 'package:elibrary/view/screen/auth/login_screen.dart';
import 'package:elibrary/view/screen/auth/sigin_screen.dart';
import 'package:elibrary/view/screen/cart_screen.dart';
import 'package:elibrary/view/screen/main_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../logic/binding/auth_binding.dart';
import '../view/screen/splash.dart';


class AppRoutes{
  //initialRoute

  static const welcome=Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  //GetPage

  static final routes=[
    GetPage(name: Routes.welcomeScreen,
        page:()=> SplashScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page:()=> LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.singUpScreen,
      page:()=> SingUpScreen(),
      binding: AuthBinding(),

    ),
    GetPage(
      name: Routes.forgetPassword,
      page:()=> ForgetPassword(),
      binding: AuthBinding(),

    ),
    GetPage(
      name: Routes.mainScreen,
      page:()=> MainScreen(),
      bindings: [AuthBinding(),MainBindings(),ProductBinding()],

    ),
    GetPage(
      name: Routes.cartScreen,
      page:()=> CartScreen(),
      bindings: [AuthBinding(),ProductBinding()],

    ),
  ];
}


class Routes{

  static const welcomeScreen= '/welcomeScreen';
  static const loginScreen= '/loginScreen';
  static const singUpScreen ='/singUpScreen';
  static const forgetPassword='/forgetPassword';
  static const mainScreen ='/mainScreen';
  static const cartScreen ='/cartScreen';
}