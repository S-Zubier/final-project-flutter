import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_project/Data/CartConnection.dart';



class Cartsservice{
  Future<List<dynamic>> getcarts() async
  {
    final url = Uri.parse(CartConnectionString.Carts);
    final response = await http.get(url);
    if(response.statusCode==200){
      final Map<String, dynamic> data =
      jsonDecode(response.body);
      final List<dynamic> listcarts = data['carts'] as List<dynamic>;
      return listcarts;
    }
    else{
      throw Exception('Faild to load carts : ${response.statusCode}');
    }
  }
}