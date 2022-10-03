

import 'package:elibrary/logic/controllers/cart_controller.dart';
import 'package:elibrary/logic/controllers/category_controller.dart';
import 'package:elibrary/logic/controllers/product_controller.dart';
import 'package:elibrary/model/product_model.dart';
import 'package:elibrary/utils/color_constant.dart';
import 'package:elibrary/view/screen/product_detals_screen.dart';
import 'package:elibrary/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;
  CategoryItems({Key? key,
    required this.categoryTitle}) :
        super(key: key);

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Get.isDarkMode?darkGreyClr:mFacebookColor,
      ),

      body:  Obx((){
        if(categoryController.isAllCategory.value){
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode?Palette.googleColor:mFacebookColor,
            ),
          );
        }else{
          return GridView.builder(
            itemCount: categoryController.categoryList.length,
            gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,

            ),
            itemBuilder: (context,index){

              return buildCardItems(
                image: categoryController.categoryList[index].image,
                price: categoryController.categoryList[index].price,
                rate: categoryController.categoryList[index].rating.rate,
                productId: categoryController.categoryList[index].id,
                productModels: categoryController.categoryList[index],
                onTap: () {
                  Get.to(() => ProductDetailsScreen(
                    productModels:
                    categoryController.categoryList[index],
                  ),
                  );
                },
              );





            },
          );
        }
      })
    );
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required Welcome productModels,
    required Function() onTap,
  }){
    return  Padding(
      padding:  const EdgeInsets.all(5),

      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),

          child: Column(
            children: [
              Obx(()=>Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: (){
                        controller.manageFavourites(productId);
                      },
                      icon:  controller.isFavourites(productId)?
                      Icon(Icons.favorite,
                        color: Colors.red,
                      ):Icon(Icons.favorite_outline,color: Colors.black,)

                  ),

                  IconButton(
                      onPressed: (){
                        cartController.addProductTocCart(
                            productModels);
                      },
                      icon:  const Icon(Icons.add,color: Colors.black,)
                  ),
                ],
              ),
              ),

              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.black:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),

              ),

              Padding(
                padding:  const EdgeInsets.only(left: 8,right: 8,top: 8,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(

                      '\$ $price ',
                      style:  const TextStyle(
                        color:Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      height: 20,
                      width: 45,

                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? Palette.googleColor:mFacebookColor,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child:  Padding(
                        padding:   const EdgeInsets.only(left: 3,right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:    [
                            TextUtils(

                                text: '$rate',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                underLine: TextDecoration.none
                            ),
                            const Icon(Icons.star,
                              size: 13,
                              color: Colors.white,)
                          ],
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}
