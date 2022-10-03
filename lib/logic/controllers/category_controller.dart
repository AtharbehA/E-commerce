


import 'package:elibrary/model/product_model.dart';
import 'package:elibrary/servies/category_servies.dart';
import 'package:get/get.dart';


class CategoryController extends GetxController{

  var isCategoryLoading = false.obs;
  var categoryNameList = <String>[].obs;
  var categoryList = <Welcome>[].obs;

  var isAllCategory = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategory();
  }

  void getCategory()async{
    var categoryName = await CategoryServices.getCategory();

    try{
      isCategoryLoading(true);
      if(categoryName.isNotEmpty){
        categoryNameList.addAll(categoryName);
      }
    }finally{
      isCategoryLoading(false);
    }
  }


   getAllCategory(String nameCategory)async{
    isAllCategory(true);
    categoryList.value=
     await AllCategorySercvises.getAllCategory(nameCategory);

      isAllCategory(false);
  }

  getCategoryIndex(int index)async{
    var categoryAllName = await getAllCategory(categoryNameList[index]);


    if(categoryAllName != null){
    categoryList.value=categoryAllName;
    }
  }
}