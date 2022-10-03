
import 'package:elibrary/logic/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class favoriteScreen  extends StatelessWidget {
   favoriteScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,


      body: Obx((){
        if (controller.favouritestList.isEmpty){
       return    Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,width: 100,
                child: Image.asset('assets/images/heart1.png'),


                ),

                SizedBox(
                  height: 20,

                ),
                Text(
                  'Please, Add your favorites product',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Get.isDarkMode?Colors.white:Colors.black
                  ),
                )


              ],
            ),
          );
        }else{
             return ListView.separated(
            itemBuilder: (context,index){
              return buildFavItem(
                  image:controller.favouritestList[index].image,
                title: controller.favouritestList[index].title,
               price: controller.favouritestList[index].price,
                productId: controller.favouritestList[index].id,
              );
            },
            separatorBuilder: (context,index){
              return const Divider(
                color: Colors.grey,
                thickness: 1,
              );
            },
            itemCount: controller.favouritestList.length,
          );
        }
      }),


    );
  }





Widget buildFavItem({
  required String image,
  required double price,
  required String title,
  required int productId,
}){
  return Padding(
      padding: const EdgeInsets.all(10,),

          child: SizedBox(
      width: double.infinity,
    height: 100,
    child: Row(
      children: [
        SizedBox(
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),

            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),

            ),
          ),

        ),
        const SizedBox(width: 15,),

        Expanded(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis

                ),
              ),
          SizedBox(height: 10,),
          Text(

            '\$ $price',
            style: TextStyle(
                color: Get.isDarkMode?Colors.white:Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis

            ),
          ),
            ]
          ),
        ),
         Spacer(),
        IconButton(
            onPressed: (){
              controller..manageFavourites(productId);
            },
            icon: Icon(Icons.favorite,
            color: Colors.red,
              size: 30,
            )
        ),
      ],
    ),
  ),
  );
}
}
