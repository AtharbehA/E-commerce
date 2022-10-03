import 'package:elibrary/view/screen/catg_screen.dart';
import 'package:elibrary/view/screen/fav_screen.dart';
import 'package:elibrary/view/screen/home_screen.dart';
import 'package:elibrary/view/screen/setting_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController{

  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    favoriteScreen(),
    settingScreen(),

  ].obs;



  final title = [
  'E_Library',
  'Categories',
    'Favorite',
    'Setting',

  ].obs;

}