

import 'package:elibrary/logic/controllers/main_controller.dart';
import 'package:elibrary/logic/controllers/setting_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());

  }

}