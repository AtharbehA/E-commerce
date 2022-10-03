import 'package:elibrary/logic/controllers/theme_controller.dart';
import 'package:elibrary/routes/routes.dart';
import 'package:elibrary/utils/color_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Firebase.initializeApp();

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Library',
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //
      //
      //
      // scaffoldBackgroundColor: Colors.white,
      //   appBarTheme: AppBarTheme(
      //     backwardsCompatibility: true,
      //     systemOverlayStyle: SystemUiOverlayStyle(
      //       statusBarColor: Colors.white,
      //       statusBarIconBrightness: Brightness.dark,
      //     ),
      //     backgroundColor: Colors.white,
      //     elevation: 0.0,
      //
      //   ),
      //
      //   //primarySwatch: Colors.blue,
      // ),
      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute:
      FirebaseAuth.instance.currentUser != null
          || GetStorage().read<bool>('auth') == true ?
      AppRoutes.mainScreen : AppRoutes.welcome,
      getPages: AppRoutes.routes,

    );
  }
}
