
import 'package:elibrary/utils/my_string.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';


class ProductServies{


  static Future <List<Welcome>>getProduct ()async{
   var response =  await http.get(Uri.parse('$baseUrl/products'));

   if(response.statusCode == 200){

     var jsonData = response.body;
     return welcomeFromJson(jsonData);


   }else{
     return throw Exception('Failed to load Product');
   }
  }
}