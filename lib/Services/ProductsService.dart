/*import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:mobile_project/models/product_model.dart';


import '../Data/ProductConnection.dart';
class ProductService{
 /* Future<List<dynamic>> getproducts() async
  {
    final url = Uri.parse(ConnectionString.Products);
    final response = await http.get(url);
    if(response.statusCode==200){
      final Map<String, dynamic> data =
      jsonDecode(response.body);
      final List<dynamic> listproducts = data['products'] as List<dynamic>;
      return listproducts;
    }
    else{
      throw Exception('Faild to lod products : ${response.statusCode}');
    }
  }*/

 */
  import 'dart:convert';
  import 'package:http/http.dart' as http;
  import '../Data/ProductConnection.dart'; //

  class ProductService {
  // دالة جلب كافة المنتجات الافتراضية
  Future<List<dynamic>> getproducts() async {
  final url = Uri.parse(ConnectionString.Products); //
  final response = await http.get(url); //
  if (response.statusCode == 200) { //
  final Map<String, dynamic> data = jsonDecode(response.body); //
  return data['products'] as List<dynamic>; //
  } else {
  throw Exception('Failed to load products : ${response.statusCode}'); //
  }
  }

  //🌟 الدالة الجديدة لتصفية جلب المنتجات بناءً على اسم القسم المختار
  Future<List<dynamic>> getProductsByCategory(String categoryName) async {
  final url = Uri.parse(ConnectionString.productsByCategory(categoryName));
  final response = await http.get(url);
  if (response.statusCode == 200) {
  final Map<String, dynamic> data = jsonDecode(response.body);
  return data['products'] as List<dynamic>;
  } else {
  throw Exception('Failed to load category products: ${response.statusCode}');
  }
  }
  }


