
import 'package:elibrary/logic/controllers/cart_controller.dart';
import 'package:elibrary/utils/color_constant.dart';
import 'package:elibrary/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {

  final controller = Get.find<CartController>();
   CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Container(
          padding: EdgeInsets.all(25),
          child:Row(

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(text: 'Total',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      underLine: TextDecoration.none
                  ),
                  Text(
                    '\$ ${controller.total}',
                    style: TextStyle(
                      color: Get.isDarkMode? Colors.white:Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5,

                    ),
                  )
                ],
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Check Out',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white

                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.shopping_cart),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),

                      ),
                      elevation: 0,
                      primary: Get.isDarkMode?Palette.googleColor:mFacebookColor,
                    ),
                  ),
                ),
              )
            ],
          )
      );
    }
    );
  }
}
