

import 'package:elibrary/servies/product_servies.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/product_model.dart';

class ProductController extends GetxController{

  var productList = <Welcome>[].obs;
  var favouritestList = <Welcome>[].obs;
  var isLoading = true.obs;
  var stoarge = GetStorage();

  //search
  var searchList = <Welcome>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

   List ? stoargeFavourites= stoarge.read<List>('isFavourites');
    if(stoargeFavourites != null){
      favouritestList =stoargeFavourites.map((e) =>
          Welcome.fromJson(e))
          .toList()
          .obs;
    }
    getProducts();
  }


 void getProducts()async{
   var products =  await ProductServies.getProduct();

   try{
     isLoading(true);
     if(products.isNotEmpty){

       productList.addAll(products);
     }

   } finally{
     isLoading(false);
   }
  }

  //logic for favourites  Screen


void manageFavourites(int productId)async{

    var exitingIndex=
    favouritestList.indexWhere((element) => element.id==productId);
    if(exitingIndex >= 0) {
      favouritestList.removeAt(exitingIndex);
      await stoarge.remove('isFavourites');
    }else{
    favouritestList.add(productList.firstWhere((element) => element.id == productId));
    await stoarge.write('isFavourites', favouritestList);
    }
  }

bool isFavourites(int productId){

    return favouritestList.any((element) => element.id==productId);
}

//Search bar
void addSearchToList(String searchName){
  searchName = searchName.toLowerCase();

    searchList.value=productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName)
      || searchPrice.toString().contains(searchName);
    }).toList();

    update();
}

void clearSearch() {
    searchTextController.clear();
    addSearchToList('');
}
}