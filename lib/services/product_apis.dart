import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductApis {
  static Future<List> fetchProducts() async {
    Future.delayed(Duration(seconds: 3));
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));
    var body = json.decode(response.body);
    var myresponse = body["products"];
    return myresponse;
  }
}
