


import 'package:elibrary/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/color_constant.dart';

class CartController extends GetxController{
  var productMap ={}.obs;

  void addProductTocCart(Welcome productModels){
   if(productMap.containsKey(productModels)) {
     productMap[productModels] +=1;

   }else{
     productMap[productModels]=1;
   }
  }

  void removeProductFarmCart(Welcome productModels){
    if(productMap.containsKey(productModels)
        && productMap[productModels]==1)
    {
      productMap.removeWhere((key, value) => key== productModels);
    }else{
      productMap[productModels] -=1;
    }


  }

  void removeOneProduct(Welcome productModels){
    productMap.removeWhere((key, value) => key== productModels);


  }
  void clearAllProduct(){
    Get.defaultDialog(
      title: 'Clean Product',
      titleStyle: const TextStyle(
        fontSize:18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need to clear product',
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

        Get.toNamed(Routes.cartScreen);
      },

      onConfirm: (){
        productMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode?Palette.googleColor:mFacebookColor,
    );


  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();

  get total =>
      productMap.entries.map((e) => e.key.price * e.value)
          .toList()
          .reduce((value, element) => value + element).toStringAsFixed(2);


  int quantity(){
    if(productMap.isEmpty){
      return 0;
    }else{
    return productMap.entries.map((e) => e.value)
        .toList().reduce((value, element) => value+element);
    }
  }

}