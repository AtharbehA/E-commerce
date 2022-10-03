

import 'package:elibrary/logic/controllers/cart_controller.dart';
import 'package:elibrary/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cart/cart_product_card.dart';
import '../widgets/cart/cart_total.dart';
import '../widgets/cart/empty_cart.dart';

class CartScreen  extends StatelessWidget {
   CartScreen ({Key? key}) : super(key: key);

   final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text('Cart Items',),
          elevation: 0,
          backgroundColor: Get.isDarkMode?darkGreyClr:mFacebookColor,
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              controller.clearAllProduct();
            },
                icon: const Icon(Icons.backspace),
            ),
          ],
        ),

        body: Obx((){

          if(controller.productMap.isEmpty){
            return const EmptyCart();
          }else{
         return SingleChildScrollView(
           child: Column(
             children: [
               SizedBox(height: 600,
                 child: ListView.separated(
                   itemBuilder: (context,index){
                     return CartProductCard(
                       productModels: controller.productMap.keys.toList()[index],
                       index: index,
                       quantity: controller.productMap.values.toList()[index],
                     );
                   },
                   separatorBuilder: (context,index) => const SizedBox(height: 20,),
                   itemCount: controller.productMap.length,
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(right: 25,top: 40,),
                 child: CartTotal(),
               ),

             ],
           ),
         );
          }
        },
        )
      ),
    );
  }
}
