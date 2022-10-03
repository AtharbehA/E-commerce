
import 'package:elibrary/utils/my_string.dart';
import 'package:http/http.dart' as http;
import '../model/category_models.dart';
import '../model/product_model.dart';


class CategoryServices{


  static Future <List<String>>getCategory ()async{
    var response =  await http.get(Uri.parse('$baseUrl/products/categories'));

    if(response.statusCode == 200){

      var jsonData = response.body;
      return categoryModelsFromJson(jsonData);

    }else{
      return throw Exception('Failed to load Product');
    }
  }
}

class AllCategorySercvises{


  static Future <List<Welcome>> getAllCategory(String Categoryname) async{
    var response =  await http.get(Uri.parse('$baseUrl/products/category/$Categoryname'));

    if(response.statusCode == 200){

      var jsonData = response.body;
      return welcomeFromJson(jsonData);

    }else{
      return throw Exception('Failed to load Product');
    }
  }
}