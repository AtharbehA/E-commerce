
import 'package:elibrary/logic/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_constant.dart';
import 'items_catgory.dart';

class GategoryWidget extends StatelessWidget {


   GategoryWidget({Key? key}) : super(key: key);


  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
    if(controller.isCategoryLoading.value){
      return  Center(
        child: CircularProgressIndicator(
          color: Get.isDarkMode?Palette.googleColor:mFacebookColor,
        ),
      );
    }else{
      return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  controller.getCategoryIndex(index);

                  Get.to(()=>CategoryItems(
                      categoryTitle: controller.categoryNameList[index],
                  ));
                },
                child: Container(
                  height: 150,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1650251811078-280d32bb0bb9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                        fit: BoxFit.cover
                    ),

                  ),
                  child:  Padding(
                    padding: EdgeInsets.only(left: 20,bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        controller.categoryNameList[index],
                        style: const TextStyle(
                          backgroundColor: Colors.black38,
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context,index){
              return const SizedBox(height: 20,);
            },
            itemCount: controller.categoryNameList.length,
        ),
      );
    }
    }
    );
  }
}
