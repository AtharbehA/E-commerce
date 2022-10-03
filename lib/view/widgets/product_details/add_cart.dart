

import 'package:elibrary/logic/controllers/cart_controller.dart';
import 'package:elibrary/model/product_model.dart';
import 'package:elibrary/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_constant.dart';

class AddCart extends StatelessWidget {

  final double price;
  final Welcome productModels;
   AddCart({Key? key,
    required this.price,
    required this.productModels}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8,top: 25,bottom: 25,right: 8),

      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const TextUtils(
                  text: 'Price',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  underLine: TextDecoration.none
              ),

              Text(

                 "\$$price",
                style: TextStyle(
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.5,
                ),
              ),
            ],

          ),
          const SizedBox(width: 20,),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                 elevation: 0,
                  primary:Get.isDarkMode?Palette.googleColor: mFacebookColor,
                ),
                  onPressed: (){
                    controller.addProductTocCart(productModels);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Add to Cart"
                      ,style: TextStyle(
                          color: Colors.white,
                          fontSize:20
                        ),

                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.shopping_cart),

                    ],
                  )
              ),
            ),
          ),
        ],
      ),

    );
  }
}
