

import 'package:elibrary/model/product_model.dart';
import 'package:elibrary/utils/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../../../logic/controllers/product_controller.dart';
import '../text_utils.dart';
import 'add_cart.dart';

class ClothesInfo extends StatelessWidget {

  final String title;
  final int productID;
  final double rate;
  final String description;
  final Welcome productModels;

  final controller = Get.find<ProductController>();
   ClothesInfo({Key? key,
    required this.title,
     required this.productID,
     required this.rate,
     required this.description,
     required this.productModels, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode?Colors.white:Colors.black,
                  ),
                ),
              ),
              Obx(()
              =>Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Get.isDarkMode?Colors.white.withOpacity(0.9)
                      :Colors.grey.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: (){
                    controller.manageFavourites(productID);
                  },

                  child: controller.isFavourites(productID)? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 20,
                  ):const Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
              ),
            ],
          ),

          Row(
            children: [
              TextUtils(
                fontSize: 14,
                fontWeight: FontWeight.bold,

                 text: '$rate',
                color: Get.isDarkMode?Colors.white:Colors.black,
                underLine: TextDecoration.none,
              ),
              const SizedBox(width: 8,),
              RatingBar(
                rating: rate,
                icon: const Icon(
                  Icons.star,
                size: 20,
                  color: Colors.grey,
                ),
                starCount: 5,
                spacing: 1,
                size: 20,
                isIndicator: false,
                allowHalfRating: true,
                onRatingCallback: (value,isIndictor){
                  isIndictor.value=true;
                },
                color: Colors.orangeAccent,
              ),
            ],
          ),
          const SizedBox(height: 20,),

          ReadMoreText(
              description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Show Lees',
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?Palette.googleColor:mFacebookColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?Palette.googleColor:mFacebookColor,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode?Colors.white:Colors.black,
            ),
          ),

          AddCart(
            price: productModels.price,
            productModels: productModels,
          ),
        ],
      ),
    );
  }
}
